<?php

use Illuminate\Support\Facades\Route;

// @todo security remove id
Route::get('invoices/{uuid}', 'Billing\Http\Controllers\InvoicesController@invoice')->name('invoice');
