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
        Schema::create('puebi_entries', function (Blueprint $table) {
            $table->id();
            $table->string('rule_title');       // nama kaidah
            $table->text('description')->nullable(); // penjelasan kaidah
            $table->text('examples')->nullable();    // contoh
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('puebi_entries');
    }
};
