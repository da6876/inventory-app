<?php

namespace App\Models\LocConfig;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AreaInfo extends Model
{
    public $timestamps = false;

    protected $table = 'soc_area';

    protected $fillable = ['id','uid','dis_id','div_id','tha_id','name', 'status','create_by','create_date','update_by','update_date'];
}
