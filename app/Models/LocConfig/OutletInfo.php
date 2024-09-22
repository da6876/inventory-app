<?php

namespace App\Models\LocConfig;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OutletInfo extends Model
{

    public $timestamps = false;

    protected $table = 'soc_outlet';

    protected $fillable = ['id','div_id','dis_id','tha_id','ara_id','uid','name', 'status','create_by','create_date','update_by','update_date'];
}
