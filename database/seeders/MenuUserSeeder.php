<?php

namespace Database\Seeders;

use App\Models\Menu\Menu;
use App\Models\UserConfig\User;
use Illuminate\Database\Seeder;

class MenuUserSeeder extends Seeder
{
    public function run()
    {
        // Fetch or create a user to assign permissions to
        $user = User::find(2); // Adjust the user ID as needed

        if (!$user) {
            $user = User::create([
                'name' => 'Example User',
                'email' => 'example@example.com',
                'password' => bcrypt('password'),
            ]);
        }

        // List of menu IDs and their respective permissions
        $menuPermissions = [
            1 => 'view', // Dashboard
            30 => 'view', // Web Settings
            3 => 'view', // Product Setup
            11 => 'view', // Product Type
            22 => 'view', // Product Info
            23 => 'view', // Sub-Category
            24 => 'view', // Category
            4 => 'view', // User Config
            12 => 'view', // User Type
            25 => 'view', // User Assigned
            26 => 'view', // Distributor Info
            27 => 'view', // User Info
            5 => 'view', // Stock Manage
            13 => 'view', // Product Stock
            6 => 'view', // Order Manage
            14 => 'view', // Outlet Order
            28 => 'view', // Distributor Order
            7 => 'view', // Delivery Manage
            15 => 'view', // Delivery to SO
            16 => 'view', // Distributor Order
            17 => 'view', // 500
            18 => 'view', // Login
            19 => 'view', // Register
            2 => 'view', // Location Config
            8 => 'view', // Division Info
            9 => 'view', // District Info
            10 => 'view', // Thana Info
            20 => 'view', // Area Info
            21 => 'view', // Outlet Info
        ];

        // Attach permissions to the user
        foreach ($menuPermissions as $menuId => $permission) {
            $menu = Menu::find($menuId);
            if ($menu) {
                $user->menus()->attach($menu->id, ['permissions' => $permission]);
            }
        }
    }
}
