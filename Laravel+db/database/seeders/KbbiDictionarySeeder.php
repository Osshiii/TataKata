<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class KbbiDictionarySeeder extends Seeder
{
    // jumlah tuple VALUES per INSERT batch (sesuaikan: 500 atau 1000)
    protected $batchSize = 500;

    public function run(): void
    {
        $path = database_path('seeders/sql/kbbi_dictionary.sql');

        if (!File::exists($path)) {
            $this->command->error("SQL file not found: {$path}");
            return;
        }

        $handle = fopen($path, 'r');
        if (!$handle) {
            $this->command->error("Cannot open SQL file: {$path}");
            return;
        }

        $this->command->info('Streaming and batching SQL file...');

        $buffer = '';
        $executedStatements = 0;
        while (!feof($handle)) {
            $line = fgets($handle);
            if ($line === false) break;

            // skip SQL comments (lines starting with -- or #)
            if (preg_match('/^\s*(--|#)/', $line)) {
                continue;
            }

            $buffer .= $line;

            // if end of statement (semicolon at the end of a line)
            if (preg_match('/;\s*$/', trim($line))) {
                $stmt = trim($buffer);
                $buffer = '';

                if ($stmt === '') {
                    continue;
                }

                // If this is an INSERT ... VALUES ... statement, handle batching
                if (preg_match('/^\s*INSERT\s+INTO\s+[`"]?([^\s`(]+)[`"]?\s*\((.*?)\)\s*VALUES\s*(.+);$/is', $stmt, $m)) {
                    // m[1] = table name (maybe with schema), m[2] = column list, m[3] = values part (big string)
                    $table = $m[1];
                    $columns = $m[2];
                    $valuesPart = trim($m[3]);

                    // Remove surrounding parentheses if the entire valuesPart is wrapped (it usually isn't)
                    // Split tuples by '),(' token but be careful with regex/multiline
                    // We assume the dump uses the common pattern: (...),(...),(...)

                    // Normalize: remove trailing semicolon if present (we already removed)
                    // Break into individual tuples using regex that splits on ")\s*,\s*(" while preserving content inside quotes
                    // This is not bulletproof for insane edge cases but works for typical SQL dumps from mysqldump

                    $tuples = preg_split("/\\)\\s*,\\s*\\(/s", $valuesPart);

                    // Clean first and last tuple: remove leading "(" from first and trailing ")" from last
                    if (count($tuples) > 0) {
                        $tuples[0] = preg_replace('/^\s*\\(/', '', $tuples[0]);
                        $tuples[count($tuples)-1] = preg_replace('/\\)\s*$/', '', $tuples[count($tuples)-1]);
                    }

                    // batch-insert in groups
                    $totalTuples = count($tuples);
                    $batches = (int) ceil($totalTuples / $this->batchSize);
                    $this->command->info("INSERT -> table: {$table}, columns: ({$columns}), tuples: {$totalTuples}, batches: {$batches}");

                    $start = 0;
                    while ($start < $totalTuples) {
                        $slice = array_slice($tuples, $start, $this->batchSize);
                        // rebuild VALUES string and wrap each tuple with parentheses
                        $valuesStr = '(' . implode('),(', $slice) . ')';
                        // reconstruct statement
                        $insertStmt = "INSERT INTO `{$table}` ({$columns}) VALUES {$valuesStr};";

                        try {
                            DB::unprepared($insertStmt);
                            $executedStatements++;
                            if ($executedStatements % 50 === 0) {
                                $this->command->info("Executed {$executedStatements} batched INSERT statements so far...");
                            }
                        } catch (\Throwable $e) {
                            // Log but continue on error
                            $this->command->error("Error executing batched INSERT: " . $e->getMessage());
                        }

                        $start += $this->batchSize;
                    }

                } else {
                    // Non-INSERT statements: run directly (CREATE TABLE, SET, etc.)
                    try {
                        DB::unprepared($stmt);
                        $executedStatements++;
                    } catch (\Throwable $e) {
                        $this->command->error("Error executing statement: " . $e->getMessage());
                    }
                }
            }
        }

        fclose($handle);

        $this->command->info("Done. Executed approx {$executedStatements} statements/batches.");
    }
}
