<?php

namespace App\Models\auth;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'menu_id'];

    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }
}
