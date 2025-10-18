<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('rule_entries', function (Blueprint $table) {
            $table->id();
            $table->string('rule_id')->index();   // slug dari puebi_entries
            $table->string('category')->index();  // mis. nama_orang, kata_kerja, kata_majemuk, dll
            $table->text('value');            // contoh value seperti "amir", "duta besar"
            $table->string('value_normalized')->nullable()->index(); // lowercase/normal
            $table->string('note')->nullable();
            $table->timestamps();

            $table->unique(['rule_id','category','value']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('rule_entries');
    }
};
