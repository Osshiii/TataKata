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
        $buffer = '';
        $inSingle = false;
        $inDouble = false;

        while (($line = fgets($handle)) !== false) {
            $len = strlen($line);
            for ($i = 0; $i < $len; $i++) {
                $ch = $line[$i];
                $next = $i + 1 < $len ? $line[$i+1] : null;

                // tangani quote
                if ($ch === "'" && !$inDouble) {
                    if ($inSingle && $next === "'") { // escape ''
                        $buffer .= "''";
                        $i++;
                        continue;
                    }
                    $inSingle = !$inSingle;
                    $buffer .= $ch;
                    continue;
                }

                if ($ch === '"' && !$inSingle) {
                    $inDouble = !$inDouble;
                    $buffer .= $ch;
                    continue;
                }

                // statement selesai hanya jika ; di luar quote
                if ($ch === ';' && !$inSingle && !$inDouble) {
                    $buffer .= $ch;
                    try {
                        DB::unprepared($buffer);
                    } catch (\Throwable $e) {
                        $this->command->error("Error executing statement: " . $e->getMessage());
                    }
                    $buffer = '';
                    continue;
                }

                $buffer .= $ch;
            }
        }

        // leftover
        if (trim($buffer) !== '') {
            try {
                DB::unprepared($buffer);
            } catch (\Throwable $e) {
                $this->command->error("Error executing trailing SQL: " . $e->getMessage());
            }
        }

        fclose($handle);
        $this->command->info("SQL import finished.");
    }
}
