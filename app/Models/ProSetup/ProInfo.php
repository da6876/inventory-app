<?php

namespace App\Models\ProSetup;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProInfo extends Model
{
    public $timestamps = false;

    protected $table = 'pro_info';

    protected $fillable = ['id','uid','name','pro_type_id','cat_id','sub_cat_id','shot_decs','decs','unit',
                            'pcs_per_ctn','dp_unit','rp_unit','mrp_unit','pro_sku_code','pro_image1','pro_image2',
                            'status','create_by','create_date','update_by','update_date'
                        ];

}
