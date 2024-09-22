<?php

namespace App\Models\LocConfig;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThanaInfo extends Model
{

    public $timestamps = false;

    protected $table = 'soc_thana';

    protected $fillable = ['id','uid','div_id','dis_id','name', 'status','create_by','create_date','update_by','update_date'];
}
