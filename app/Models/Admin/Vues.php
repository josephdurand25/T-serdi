<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vues extends Model
{
    use HasFactory;
    protected $table = 'vues';
    protected $primaryKey = 'id_view';
    protected $guarded = [];
}
