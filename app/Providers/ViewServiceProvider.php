<?php

namespace App\Providers;

use App\Models\Menu;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ViewServiceProvider extends ServiceProvider
{
    public function boot()
    {
        // Share menu data with all views
        View::composer('*', function ($view) {
            $view->with('menus', Menu::whereNull('parent_id')
                ->with('children')
                ->orderBy('order')
                ->get());
        });
    }


    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */

}
