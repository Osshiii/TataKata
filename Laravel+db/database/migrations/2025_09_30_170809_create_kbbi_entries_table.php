<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('kbbi_entries', function (Blueprint $table) {
            $table->id();
            $table->string('lemma'); // kata dasar
            $table->text('definition')->nullable(); // definisi
            $table->string('word_class')->nullable(); // kelas kata (nomina, verba, dsb)
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('kbbi_entries');
    }
};
