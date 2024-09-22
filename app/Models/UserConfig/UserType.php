<?php

namespace App\Models\UserConfig;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserType extends Model
{
    public $timestamps = false;

    protected $table = 'user_role';

    protected $fillable = ['id','uid','name', 'status','create_by','create_date','update_by','update_date'];

}

