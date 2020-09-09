<?php

namespace Billing\Http\Controllers;

use App\Http\Controllers\Controller;
use Billing\Models\Invoice;
use Billing\Models\InvoiceDetail;
use Billing\Models\Organization;
use LaravelDaily\Invoices\Invoice as LaravelDailyInvoice;
use LaravelDaily\Invoices\Classes\Party;
use LaravelDaily\Invoices\Classes\InvoiceItem;

class InvoicesController extends Controller
{
    function invoice(string $uuid) {
        $invoice = Invoice::where(['id' => $uuid])->first();

        $invoiceDetails = $invoice->invoice_details()->first();
        $customer = $invoiceDetails->customer()->first();
        $tenant = $invoiceDetails->tenant()->first();
        // @todo country dependent
        $customerAddress = $customer->postal_address->street_address . ' '. $customer->postal_address->postal_code . ' '. $customer->postal_address->address_locality;
        // $tenantAddress = $tenant->postal_address->street_address . ' '. $tenant->postal_address->postal_code . ' '. $tenant->postal_address->address_locality;

        $client = new Party([
            'name'          => $tenant->legal_name,
            // 'address'       => $tenantAddress,
            'phone'         => $tenant->telephone,
            'custom_fields' => [
                'note'        => 'IDDQD',
                'business id' => '365#GG',
            ],
        ]);

        $invoicedCustomer = new Party([
            'name'          => $customer->legal_name,
            'address'       => $customerAddress,
            'code'          => '#22663214',
            'custom_fields' => [
                'order number' => '> 654321 <',
            ],
        ]);

        $invoiceItems = $invoice->invoice_item_details()->get();
        $items = [];
        foreach($invoiceItems as $item) {
            $product = $item->product()->first();
            $unit = $item->unit()->first();

            $items[] = (new InvoiceItem())
                ->title($product->name)
                ->pricePerUnit($product->price)
                ->quantity($item->qty)
                // ->discount(10)
                // ->discountByPercent(9)
                ->units($unit->name)
                ;
        }

        $notes = [
            'your multiline',
            'additional notes',
            'in regards of delivery or something else',
        ];
        $notes = implode("<br>", $notes);

        $invoice = LaravelDailyInvoice::make('receipt')
            // ->date(now()->subWeeks(3))
            ->seller($client)
            ->buyer($invoicedCustomer);

        $tenantSerial = $tenant->invoice_serials()->first();
        $invoice->series($tenantSerial->serial_number_series)
            ->sequence($tenantSerial->serial_number_sequence)
            ->serialNumberFormat($tenantSerial->serial_number_format)
            ->payUntilDays($tenantSerial->pay_until_days);

        $customerDate = $customer->postal_address->country->date()->first();
        $invoice->dateFormat($customerDate->format);

        $customerCurrency = $customer->postal_address->country->currency()->first();
        $invoice->currencySymbol($customerCurrency->symbol)
            ->currencyCode($customerCurrency->code)
            ->currencyFormat($customerCurrency->format)
            ->currencyThousandsSeparator($customerCurrency->thousands_separator)
            ->currencyDecimalPoint($customerCurrency->decimal_point);

        $invoice->filename($tenant->name . ' ' . $customer->name)
            ->addItems($items)
            ->notes($notes)
            // ->logo(public_path('vendor/invoices/sample-logo.png'))
            // You can additionally save generated invoice to configured disk
            ->save('public');

        $link = $invoice->url();
        // Then send email to party with link

        // And return invoice itself to browser or have a different view
        return $invoice->stream();
    }
}