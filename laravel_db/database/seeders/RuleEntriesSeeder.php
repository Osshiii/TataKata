<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;

class RuleEntriesSeeder extends Seeder
{
    public function run()
    {
        $now = Carbon::now();

        // Ambil semua puebi_entries (slug, title, content_markdown)
        $entries = DB::table('puebi_entries')->select('slug','title','content_markdown')->get();

        $countInserted = 0;
        foreach ($entries as $e) {
            $slug = $e->slug;
            $md = $e->content_markdown ?? '';

            // 1) Heuristik: cari blok 'Misalnya:' atau 'Misalnya' (case-insensitive)
            $examples = $this->extractExamplesFromMarkdown($md);

            // 2) Jika tidak ditemukan contoh eksplisit, coba ambil judul/short phrases (fallback)
            if (empty($examples)) {
                // fallback: ambil kata-kata dari judul yang mungkin berguna
                $examples[] = $e->title;
            }

            // 3) Tentukan kategori default: gunakan slug atau sederhana map
            $category = $this->mapSlugToCategory($slug);

            // 4) Masukkan setiap example ke rule_entries
            foreach ($examples as $val) {
                $norm = $this->normalizeValue($val);
                if ($norm === '') continue;

                try {
                    DB::table('rule_entries')->updateOrInsert(
                        [
                            'rule_id' => $slug,
                            'category' => $category,
                            'value' => $val
                        ],
                        [
                            'value_normalized' => $norm,
                            'note' => 'Generated from puebi_entries',
                            'created_at' => $now,
                            'updated_at' => $now
                        ]
                    );
                    $countInserted++;
                } catch (\Throwable $ex) {
                    $this->command->error("Error inserting {$slug} / {$category} / {$val} : " . $ex->getMessage());
                }
            }
        }

        $this->command->info("RuleEntriesSeeder finished. Inserted/updated: {$countInserted}");
    }

    protected function normalizeValue(string $v): string
    {
        // lowercase, collapse whitespace, trim punctuation edges
        $v = trim($v);
        $v = preg_replace('/\s+/', ' ', $v);
        $v = mb_strtolower($v);
        // optionally remove surrounding quotes
        $v = trim($v, "\"'` ");
        return $v;
    }

    protected function mapSlugToCategory(string $slug): string
    {
        // Minimal mapping — tambahkan sesuai kebutuhan.
        $map = [
            'huruf-kapital' => 'nama_orang',
            'gabungan-kata' => 'kata_majemuk',
            'kata-depan' => 'kata_depan',
            'kata-berimbuhan' => 'kata_kerja',
            'singkatan-dan-akronim' => 'singkatan',
            'huruf-miring' => 'judul_karya',
            // ... tambah mapping lain sesuai rules yang kamu pakai
        ];
        return $map[$slug] ?? 'default';
    }

    protected function extractExamplesFromMarkdown(string $md): array
    {
        $out = [];

        // Normalize line endings
        $md = str_replace(["\r\n","\r"], "\n", $md);

        // 1) Cari blok yang diawali dengan kata "Misalnya" diikuti newline dan kemudian bullet list lines (- ...).
        if (preg_match_all('/Misalnya[:\s]*\n((?:[ \t]*[-\*]\s.*\n)+)/iu', $md, $m)) {
            foreach ($m[1] as $block) {
                // ambil setiap baris bullet
                preg_match_all('/^[ \t]*[-\*]\s*(.+)$/m', $block, $lines);
                foreach ($lines[1] as $line) {
                    $items = $this->splitCompositeExamples($line);
                    foreach ($items as $it) $out[] = $it;
                }
            }
        }

        // 2) Cari pola daftar inline setelah 'Misalnya:' (contoh: "Misalnya: amir, hamzah, supratman")
        if (preg_match_all('/Misalnya[:\s]*([^\n]+)/iu', $md, $m2)) {
            foreach ($m2[1] as $line) {
                // kalau line mengandung comma/separator, parse
                if (strpos($line, ',') !== false) {
                    $parts = array_map('trim', explode(',', $line));
                    foreach ($parts as $p) {
                        if ($p !== '') $out[] = $p;
                    }
                }
            }
        }

        // 3) Cari lists yang bukan langsung bertanda 'Misalnya' — beberapa section punya lists tanpa kata 'Misalnya'
        // contoh: lines that look like list of examples: lines starting with '-' or lines within table cells
        if (empty($out)) {
            if (preg_match_all('/^[ \t]*[-\*]\s*(.+)$/m', $md, $linesAll)) {
                foreach ($linesAll[1] as $line) {
                    $items = $this->splitCompositeExamples($line);
                    foreach ($items as $it) $out[] = $it;
                }
            }
        }

        // 4) Remove duplicates and cleanup
        $out = array_unique(array_map(fn($v) => trim($v), $out));
        // Filter short noise
        $out = array_filter($out, fn($v) => mb_strlen($v) >= 1);

        return array_values($out);
    }

    protected function splitCompositeExamples(string $line): array
    {
        // Sometimes example lines contain multiple items separated by commas.
        $parts = preg_split('/\s*,\s*/', $line);
        $clean = [];
        foreach ($parts as $p) {
            // remove markdown emphasis markers and stray punctuation
            $p = preg_replace('/[*_`"]+/', '', $p);
            $p = trim($p);
            if ($p !== '') $clean[] = $p;
        }
        return $clean;
    }
}
