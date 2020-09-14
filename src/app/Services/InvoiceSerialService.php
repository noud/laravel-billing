<?php

namespace Billing\Services;

use Billing\Models\Invoice;
use Billing\Models\InvoiceDetail;
use Billing\Models\Organization;

class InvoiceSerialService
{
    function up(Invoice $invoice) {
        $invoiceDetails = $invoice->invoice_details()->first();
        $tenant = $invoiceDetails->tenant()->first();

        $tenantSerial = $tenant->invoice_serials()->first();
        $tenantSerial->serial_number_sequence = $tenantSerial->serial_number_sequence + 1;
        $tenantSerial->save();
    }
}
