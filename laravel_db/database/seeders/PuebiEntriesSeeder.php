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

        if (!File::exists($path)) {
            $this->command->error("File not found: {$path}");
            return;
        }

        $this->command->info("Importing SQL from: {$path}");
        $this->executeSqlFileStreaming($path, 'puebi_entries');
        $this->command->info("SQL import finished for PUEBI entries.");
    }

    /**
     * Streaming-safe SQL executor: split only on semicolons OUTSIDE quoted strings/comments.
     */
    protected function executeSqlFileStreaming(string $path, string $targetTable = null): void
    {
        $handle = fopen($path, 'r');
        if (!$handle) {
            $this->command->error("Cannot open SQL file: {$path}");
            return;
        }

        $buffer = '';
        $inSingle = false;
        $inDouble = false;
        $inLineComment = false;
        $inBlockComment = false;

        while (($line = fgets($handle)) !== false) {
            $len = strlen($line);
            for ($i = 0; $i < $len; $i++) {
                $ch = $line[$i];
                $next = ($i + 1 < $len) ? $line[$i + 1] : null;

                // start of line comment "--"
                if (!$inSingle && !$inDouble && !$inLineComment && !$inBlockComment && $ch === '-' && $next === '-') {
                    $inLineComment = true;
                    $buffer .= $ch;
                    continue;
                }

                // start of block comment "/*"
                if (!$inSingle && !$inDouble && !$inLineComment && !$inBlockComment && $ch === '/' && $next === '*') {
                    $inBlockComment = true;
                    $buffer .= '/*';
                    $i++;
                    continue;
                }

                // end of block comment "*/"
                if ($inBlockComment && $ch === '*' && $next === '/') {
                    $inBlockComment = false;
                    $buffer .= '*/';
                    $i++;
                    continue;
                }

                // end of line comment (newline)
                if ($inLineComment && ($ch === "\n" || $ch === "\r")) {
                    $inLineComment = false;
                    $buffer .= $ch;
                    continue;
                }

                // if currently inside a comment, just append
                if ($inLineComment || $inBlockComment) {
                    $buffer .= $ch;
                    continue;
                }

                // handle single quotes (SQL uses '' to escape a single quote)
                if ($ch === "'" && !$inDouble) {
                    if ($inSingle) {
                        if ($next === "'") { // escaped quote ''
                            $buffer .= "''";
                            $i++;
                            continue;
                        }
                        $inSingle = false;
                        $buffer .= $ch;
                        continue;
                    } else {
                        $inSingle = true;
                        $buffer .= $ch;
                        continue;
                    }
                }

                // handle double quotes
                if ($ch === '"' && !$inSingle) {
                    if ($inDouble) {
                        if ($next === '"') { // escaped ""
                            $buffer .= '""';
                            $i++;
                            continue;
                        }
                        $inDouble = false;
                        $buffer .= $ch;
                        continue;
                    } else {
                        $inDouble = true;
                        $buffer .= $ch;
                        continue;
                    }
                }

                // semicolon outside any quotes/comments => end of statement
                if ($ch === ';' && !$inSingle && !$inDouble && !$inLineComment && !$inBlockComment) {
                    $buffer .= $ch;
                    $stmt = trim($buffer);
                    $buffer = '';

                    if ($stmt !== '') {
                        // remove CREATE DATABASE / USE
                        $stmt = preg_replace('/CREATE DATABASE.*?;\\s*/is', '', $stmt);
                        $stmt = preg_replace('/USE\s+[`]?[a-zA-Z0-9_]+[`]?\s*;/i', '', $stmt);

                        if ($targetTable) {
                            $stmt = preg_replace_callback(
                                '/INSERT\s+INTO\s+([`"]?[\w\d\.\-`"]+)/i',
                                fn($m) => 'INSERT INTO `' . $targetTable . '`',
                                $stmt,
                                1
                            );
                        }

                        try {
                            DB::unprepared($stmt);
                        } catch (\Throwable $e) {
                            $this->command->error("Error executing statement: " . $e->getMessage());
                        }
                    }
                    continue;
                }

                // normal append
                $buffer .= $ch;
            }
        }

        // leftover SQL
        $left = trim($buffer);
        if ($left !== '') {
            $left = preg_replace('/CREATE DATABASE.*?;\\s*/is', '', $left);
            $left = preg_replace('/USE\s+[`]?[a-zA-Z0-9_]+[`]?\s*;/i', '', $left);
            try {
                DB::unprepared($left);
            } catch (\Throwable $e) {
                $this->command->error("Error executing trailing SQL: " . $e->getMessage());
            }
        }

        fclose($handle);
    }
}
