<?php

namespace App\Models\ProSetup;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProType extends Model
{
    public $timestamps = false;

    protected $table = 'pro_type';

    protected $fillable = ['id','uid','name', 'status','create_by','create_date','update_by','update_date'];

}
