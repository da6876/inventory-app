<?php

namespace App\Models\Menu;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleMenuPermission extends Model
{
    // Specify the table associated with the model
    protected $table = 'role_menu_permissions';

    // Disable timestamps if not needed
    public $timestamps = true; // Set to false if you don't want timestamps

    // Specify the attributes that are mass assignable
    protected $fillable = [
        'role_id',   // The ID of the role
        'menu_id',   // The ID of the menu
        'view',      // Permission to view
        'add',       // Permission to add
        'update',    // Permission to update
        'delete'     // Permission to delete
    ];

    // Optionally define casts for attributes if needed
    protected $casts = [
        'view' => 'boolean',
        'add' => 'boolean',
        'update' => 'boolean',
        'delete' => 'boolean',
    ];

    public function menu()
    {
        return $this->belongsTo(Menu::class, 'menu_id');
    }
}
