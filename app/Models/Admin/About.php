<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class About extends Model
{
    use HasFactory;
    protected $primaryKey = 'id_about';
    protected $table = 'abouts';
    protected $guarded = [];

    public function abouts(){
        return $this->belongsTo(Setting::class , 'id_gear');
    }
}
