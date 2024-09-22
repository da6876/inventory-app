<?php

namespace Database\Seeders;

use App\Models\auth\Role;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    public function run()
    {
        Role::create(['name' => 'root', 'description' => 'Root']);
        Role::create(['name' => 'admin', 'description' => 'Admin']);
        Role::create(['name' => 'Administrator', 'description' => 'Administrator']);
        Role::create(['name' => 'editor', 'description' => 'Editor']);
        Role::create(['name' => 'user', 'description' => 'Regular User']);
        Role::create(['name' => 'demo_user', 'description' => 'Demo User']);
    }
}
