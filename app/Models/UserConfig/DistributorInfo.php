<?php

namespace App\Models\UserConfig;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DistributorInfo extends Model
{
    public $timestamps = false;

    protected $table = 'distributors';

    protected $fillable = ['id', 'uid', 'user_id', 'owner_name', 'owner_phone', 'owner_email',
        'company_name', 'company_phone', 'company_email', 'address',
        'status', 'create_by', 'create_date', 'update_by', 'update_date'];

}

