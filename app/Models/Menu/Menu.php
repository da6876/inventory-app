<?php

namespace App\Models\Menu;

use App\Models\auth\Permission;
use App\Models\auth\User;
use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    public $timestamps = false;
    protected $fillable = ['title', 'uid','url', 'icon', 'parent_id', 'order', 'status', 'create_by', 'create_date', 'update_by', 'update_date'];


    public function parent()
    {
        return $this->belongsTo(Menu::class, 'parent_id');
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'menu_user')
            ->withPivot('permissions')
            ->withTimestamps();
    }

    public function children()
    {
        return $this->hasMany(Menu::class, 'parent_id');
    }

    // Define relationship for permissions
    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'permission_role', 'menu_id', 'permission_id')
            ->withPivot('role_id'); // Include the role_id if needed
    }

}
