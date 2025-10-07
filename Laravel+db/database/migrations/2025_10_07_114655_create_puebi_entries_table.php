<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('puebi_entries', function (Blueprint $table) {
            $table->id();
            $table->string('slug');
            $table->text('title')->nullable(); // contoh: 'K. Tanda Petik Tunggal ("…")'
            $table->text('path')->nullable(); // contoh: 'tanda-baca/tanda-petik-tunggal.md'
            $table->longText('content_markdown')->nullable(); // isi markdown panjangnya
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('puebi_entries');
    }
};
