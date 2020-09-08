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
        $client = $invoiceDetails->tenant()->first();

        $client = new Party([
            'name'          => $client->legal_name,
            'phone'         => $client->telephone,
            'custom_fields' => [
                'note'        => 'IDDQD',
                'business id' => '365#GG',
            ],
        ]);

        $customer = new Party([
            'name'          => $customer->legal_name,
            'address'       => 'The Green Street 12',
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
            ->series('BIG')
            ->sequence(667)
            ->serialNumberFormat('{SEQUENCE}/{SERIES}')
            ->seller($client)
            ->buyer($customer)
            ->date(now()->subWeeks(3))
            ->dateFormat('m/d/Y')
            ->payUntilDays(14)
            ->currencySymbol('$')
            ->currencyCode('USD')
            ->currencyFormat('{SYMBOL}{VALUE}')
            ->currencyThousandsSeparator('.')
            ->currencyDecimalPoint(',')
            ->filename($client->name . ' ' . $customer->name)
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