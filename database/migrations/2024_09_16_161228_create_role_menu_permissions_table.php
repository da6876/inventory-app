<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('role_menu_permissions', function (Blueprint $table) {
            $table->id(); // Auto-incrementing primary key
            $table->unsignedBigInteger('role_id'); // Foreign key for the role
            $table->unsignedBigInteger('menu_id'); // Foreign key for the menu
            $table->boolean('view')->default(false); // Permission to view
            $table->boolean('add')->default(false); // Permission to add
            $table->boolean('update')->default(false); // Permission to update
            $table->boolean('delete')->default(false); // Permission to delete
            $table->timestamps(); // Created at and updated at timestamps

            // Foreign key constraints (assuming roles and menus tables exist)
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('role_menu_permissions');
    }
};
