<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('checks', function (Blueprint $table) {
            $table->id();

            // FK ke tabel documents
            $table->foreignId('document_id')->unique()->constrained('documents')->onDelete('cascade'); 

            $table->text('correction_result')->nullable(); 
            $table->enum('check_status', ['Pending', 'Needs Revision', 'Completed'])->default('Pending');
            $table->string('final_result_file')->nullable(); 

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('checks');
    }
};