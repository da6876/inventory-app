<?php

namespace App\Providers;

use App\Models\Menu\Menu;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Auth;

class ViewServiceProvider extends ServiceProvider
{

    public function boot()
    {
        View::composer('*', function ($view) {
            $user = Auth::user();
            $roleId = $user ? $user->role_id : null;
            if ($roleId) {
                $menus = Menu::whereNull('parent_id')
                    ->whereHas('permissions', function ($query) use ($roleId) {
                        $query->where('role_id', $roleId)
                            ->where('name', 'view');  // Filter by the permission name
                    })
                    ->orderBy('order') // Order by the 'order' column
                    ->with(['children' => function ($query) use ($roleId) {
                        $query->whereHas('permissions', function ($query) use ($roleId) {
                            $query->where('role_id', $roleId)
                                ->where('name', 'view');  // Filter for child menus
                        })
                            ->orderBy('order'); // Order child menus by the 'order' column
                    }])
                    ->get();
            } else {
                $menus = collect();
            }
            $view->with('menus', $menus);
        });
    }
    public function register(): void
    {
        //
    }

}
