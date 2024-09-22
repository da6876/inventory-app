<?php

namespace App\Models\auth;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PermissionRole extends Model
{

    public $timestamps = false;

    protected $table = 'permission_role';

    protected $fillable = ['role_id','menu_id','permission_id'];
}
