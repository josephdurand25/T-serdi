<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        //
        Schema::create('produits', function (Blueprint $table) {
            $table->id('id_produit');
            $table->bigInteger('produit_id_gear');
            $table->string('intitule');
            $table->string('description');
            $table->string('img_produit');
            $table->boolean('published')->default(true);
            $table->timestamps();
            $table->foreign('produit_id_gear')->references('id_gear')->on('settings')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
