<?php

namespace App\Models\auth;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    public $timestamps = false;

    protected $fillable = [
        'uid',
        'role_id',
        'name',
        'user_name',
        'email',
        'password',
        'longitude',
        'latitude',
        'ip',
        'mac',
        'last_login',
        'create_by',
        'create_date',
        'update_date',
        'update_by',
        'token',
        'status',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];
    protected $casts = [
        'email_verified_at' => 'datetime',
        'last_login' => 'datetime',
    ];
    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }
    public function hasRole($roleName)
    {
        return $this->roles()->where('name', $roleName)->exists();
    }
    public function hasPermission($permissionName)
    {
        foreach ($this->roles as $role) {
            if ($role->permissions()->where('name', $permissionName)->exists()) {
                return true;
            }
        }
        return false;
    }
}
