<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Illuminate\Support\Str;

class UsersTableSeeder extends Seeder
{
    /**
     * Seed the users table.
     *
     * @return void
     */
    public function run()
    {
        // Insert an admin user
        DB::table('users')->insert([
            'uid' => 'admin001',
            'name' => 'Admin User',
            'user_name' => 'adminuser',
            'email' => 'admin@example.com',
            'email_verified_at' => Carbon::now(),
            'password' => Hash::make('password1234'),
            'longitude' => '0.000000',
            'latitude' => '0.000000',
            'ip' => '127.0.0.1',
            'mac' => '00:00:00:00:00:00',
            'last_login' => Carbon::now(),
            'create_by' => 'system',
            'create_date' => Carbon::now(),
            'update_date' => Carbon::now(),
            'update_by' => 'system',
            'token' =>  Str::random(60),
        ]);

        // Insert a super admin user
        DB::table('users')->insert([
            'uid' => 'superadmin001',
            'name' => 'Super Admin',
            'user_name' => 'superadmin',
            'email' => 'superadmin@example.com',
            'email_verified_at' => Carbon::now(),
            'password' => Hash::make('password1234'),
            'longitude' => '0.000000',
            'latitude' => '0.000000',
            'ip' => '127.0.0.1',
            'mac' => '00:00:00:00:00:01',
            'last_login' => Carbon::now(),
            'create_by' => 'system',
            'create_date' => Carbon::now(),
            'update_date' => Carbon::now(),
            'update_by' => 'system',
            'token' => Str::random(60),
        ]);
    }
}
