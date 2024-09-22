<?php

namespace App\Models\LocConfig;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DivisionInfo extends Model
{

    public $timestamps = false;

    protected $table = 'soc_divisions';

    protected $fillable = ['id','uid','name', 'status','create_by','create_date','update_by','update_date'];
}
