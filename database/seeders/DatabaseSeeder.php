<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\auth\Permission;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //$this->call(UsersTableSeeder::class);

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
        Permission::create(['name' => 'pro_category_view']);
        Permission::create(['name' => 'pro_category_create']);
        Permission::create(['name' => 'pro_category_edit']);
        Permission::create(['name' => 'pro_category_delete']);

        Permission::create(['name' => 'pro_sub_category_view']);
        Permission::create(['name' => 'pro_sub_category_create']);
        Permission::create(['name' => 'pro_sub_category_edit']);
        Permission::create(['name' => 'pro_sub_category_delete']);

        Permission::create(['name' => 'distributor_view']);
        Permission::create(['name' => 'distributor_create']);
        Permission::create(['name' => 'distributor_edit']);
        Permission::create(['name' => 'distributor_delete']);

        Permission::create(['name' => 'user_view']);
        Permission::create(['name' => 'user_create']);
        Permission::create(['name' => 'user_edit']);
        Permission::create(['name' => 'user_delete']);

        Permission::create(['name' => 'roles_view']);
        Permission::create(['name' => 'roles_create']);
        Permission::create(['name' => 'roles_edit']);
        Permission::create(['name' => 'roles_delete']);

        Permission::create(['name' => 'permissions_view']);
        Permission::create(['name' => 'permissions_create']);
        Permission::create(['name' => 'permissions_edit']);
        Permission::create(['name' => 'permissions_delete']);

        Permission::create(['name' => 'stocks_view']);
        Permission::create(['name' => 'stocks_create']);
        Permission::create(['name' => 'stocks_edit']);
        Permission::create(['name' => 'stocks_delete']);

        Permission::create(['name' => 'menus_view']);
        Permission::create(['name' => 'menus_create']);
        Permission::create(['name' => 'menus_edit']);
        Permission::create(['name' => 'menus_delete']);

        Permission::create(['name' => 'division_view']);
        Permission::create(['name' => 'division_create']);
        Permission::create(['name' => 'division_edit']);
        Permission::create(['name' => 'division_delete']);

        Permission::create(['name' => 'district_view']);
        Permission::create(['name' => 'district_create']);
        Permission::create(['name' => 'district_edit']);
        Permission::create(['name' => 'district_delete']);

        Permission::create(['name' => 'outlet_view']);
        Permission::create(['name' => 'outlet_create']);
        Permission::create(['name' => 'outlet_edit']);
        Permission::create(['name' => 'outlet_delete']);

        Permission::create(['name' => 'area_view']);
        Permission::create(['name' => 'area_create']);
        Permission::create(['name' => 'area_edit']);
        Permission::create(['name' => 'area_delete']);

        Permission::create(['name' => 'thana_view']);
        Permission::create(['name' => 'thana_create']);
        Permission::create(['name' => 'thana_edit']);
        Permission::create(['name' => 'thana_delete']);
    }
}
