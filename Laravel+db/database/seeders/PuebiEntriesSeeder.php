<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class PuebiEntriesSeeder extends Seeder
{
    public function run(): void
    {
        $path = database_path('seeders/sql/puebi_entries_safe.sql');
        if (!File::exists($path)) { $this->command->error("File not found: {$path}"); return; }
        // convert target DB on the fly and remove CREATE DATABASE
        $sql = File::get($path);
        $sql = preg_replace('/CREATE DATABASE.*?;\\s*/is', '', $sql);
        $sql = str_replace('USE puebi;', 'USE tatakata;', $sql);
        DB::unprepared($sql);
        $this->command->info("Imported PUEBI entries.");
    }
}

