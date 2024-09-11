<?php

namespace App\Models\ProSetup;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProSubCategory extends Model
{
    public $timestamps = false;

    protected $table = 'pro_sub_category';

    protected $fillable = ['id','uid','cat_id','name', 'status','create_by','create_date','update_by','update_date'];

}
