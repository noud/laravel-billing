<?php

namespace Billing\Providers;

use Illuminate\Support\ServiceProvider;

class BillingServiceProvider extends ServiceProvider
{
    public function boot()
    {
        foreach (glob(__DIR__.'/../../database/migrations/*.php') as $file) {
            $this->loadMigrationsFrom($file);
        }

        $this->loadRoutesFrom(__DIR__.'/../../routes/web.php');
    }
}
