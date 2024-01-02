<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    protected $primaryKey = 'id_service';
    protected $table = 'services';
    protected $guarded = [];

    public function services(){
        return $this->belongsTo(Setting::class , 'id_gear');
    }
}
