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
        Schema::create('text_entries', function (Blueprint $table) {
            $table->id();
            // Kunci asing ke tabel users (untuk otorisasi)
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            
            // title (Opsional)
            $table->string('title')->nullable();
            
            // content (Teks asli)
            $table->longText('content'); 
            
            // corrected_content (Hasil dari API)
            $table->longText('corrected_content')->nullable();
            
            // Status pengunggahan dan pemeriksaan
            $table->string('upload_status')->default('pending'); 
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('text_entries');
    }
};