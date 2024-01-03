<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;
    protected $primaryKey = 'id_gear';
    protected $table = 'settings';
    protected $guarded = [];

    public function abouts(){
        return $this->hasMany(About::class,'id_gear');
    }
    public function services(){
        return $this->hasMany(Service::class,'id_gear');
    }
    public function produits(){
        return $this->hasMany(Produit::class,'id_gear');
    }
    public function vues(){
        return $this->hasMany(Vue::class,'id_gear');
    }
}
