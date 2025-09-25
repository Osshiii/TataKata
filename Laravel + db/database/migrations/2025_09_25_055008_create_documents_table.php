<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('documents', function (Blueprint $table) {
            $table->id(); 
            // FK ke tabel users (Pengguna)
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade'); 

            $table->string('file_name'); 
            $table->string('file_location');
            $table->enum('upload_status', ['Uploaded', 'Cancelled'])->default('Uploaded');
            
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('documents');
    }
};