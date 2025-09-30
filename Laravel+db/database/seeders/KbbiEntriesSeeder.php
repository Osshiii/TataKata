<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class KbbiEntriesSeeder extends Seeder
{
    public function run(): void
    {
        $path = database_path('seeders/sql/kbbi_entries_fixed.sql');
        $this->command->info("Importing SQL from: {$path}");

        if (!file_exists($path)) {
            $this->command->error("File not found: {$path}");
            return;
        }

        $handle = fopen($path, "r");
        $statement = "";

        while (($line = fgets($handle)) !== false) {
            // Skip komentar (--) atau baris kosong
            if (substr($line, 0, 2) == '--' || trim($line) === '') {
                continue;
            }

            $statement .= $line;

            // Jika sudah ketemu tanda ; di akhir → eksekusi statement
            if (substr(trim($line), -1) == ';') {
                try {
                    DB::unprepared($statement);
                } catch (\Exception $e) {
                    $this->command->error("Error executing statement: " . $e->getMessage());
                }
                $statement = "";
            }
        }

        fclose($handle);
        $this->command->info("SQL import finished.");
    }
}
