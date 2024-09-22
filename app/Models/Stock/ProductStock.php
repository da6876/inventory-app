<?php

namespace App\Models\Stock;

use App\Models\ProSetup\ProInfo;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductStock extends Model
{
    // Table associated with the model
    protected $table = 'product_stock';

    // Primary key associated with the table
    protected $primaryKey = 'id';

    // Disable timestamps if you don't have `created_at` and `updated_at` columns
    public $timestamps = false;

    // The attributes that are mass assignable
    protected $fillable = [
        'pro_id', 'batch_number', 'production_date', 'expiry_date',
        'quantity_in_stock', 'mrp', 'dealer_price', 'status',
        'create_by', 'create_date', 'update_by', 'update_date'
    ];

    // The attributes that should be cast to native types
    protected $casts = [
        'production_date' => 'datetime:Y-m-d',
        'expiry_date' => 'datetime:Y-m-d',
        'create_date' => 'datetime',
        'update_date' => 'datetime'
    ];

    // Define the relationship to the ProInfo model
    public function proInfo()
    {
        return $this->belongsTo(ProInfo::class, 'pro_id');
    }
}
