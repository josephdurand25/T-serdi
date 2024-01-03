<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produit extends Model
{
    use HasFactory;
    protected $primaryKey = 'id_produit';
    protected $table = 'produits';
    protected $guarded = [];

    public function produits(){
        return $this->belongsTo(Setting::class , 'id_gear');
    }
}
