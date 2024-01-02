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
        Schema::create('abouts', function (Blueprint $table) {
            $table->id('id_about');
            $table->integer('about_id_gear');
            $table->string('img_about');
            $table->string('text_about');
            $table->boolean('published')->default(true);
            $table->timestamps();
            $table->foreign('about_id_gear')->references('id_gear')->on('settings')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('abouts');
    }
};
