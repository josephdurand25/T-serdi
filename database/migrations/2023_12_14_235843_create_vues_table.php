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
        Schema::create('vues', function (Blueprint $table) {
            $table->id('id_view');
            $table->string('name_view', 40);
            $table->string('ico_view', 150);
            $table->string('view_page', 30);
            $table->string('view_folder', 30);
            $table->boolean('published')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vues');
    }
};
