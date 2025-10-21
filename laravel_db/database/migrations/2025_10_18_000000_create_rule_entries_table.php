<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    public function up()
    {
        Schema::create('rule_entries', function (Blueprint $table) {
            $table->id();
            $table->string('rule_id')->index();   // slug dari puebi_entries
            $table->string('category')->index();  // mis. nama_orang, kata_kerja, kata_majemuk, dll
            $table->text('value');                // contoh value seperti "amir", "duta besar"
            $table->string('value_normalized')->nullable()->index(); // lowercase/normal
            $table->string('note')->nullable();
            $table->timestamps();
        });

        // Tambahkan index unik dengan panjang key untuk kolom TEXT
        DB::statement('ALTER TABLE rule_entries ADD UNIQUE KEY rule_entries_rule_id_category_value_unique (rule_id, category, value(191))');
    }

    public function down()
    {
        Schema::dropIfExists('rule_entries');
    }
};
