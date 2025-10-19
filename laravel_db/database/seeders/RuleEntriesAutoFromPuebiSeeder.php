<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class RuleEntriesAutoFromPuebiSeeder extends Seeder
{
    public function run()
    {
        $now = Carbon::now();
        $entries = DB::table('puebi_entries')->select('slug', 'title', 'content_markdown')->get();
        $inserted = 0;

        // === 0️⃣ Peta slug ke kategori bawaan ===
        $slugCategoryMap = [
            // huruf
            'huruf-vokal' => 'huruf',
            'huruf-konsonan' => 'huruf',
            'huruf-kapital' => 'nama_orang',
            'huruf-miring' => 'judul_karya',
            'huruf-tebal' => 'penegasan',

            // tanda baca
            'tanda-petik' => 'judul_karya',
            'tanda-seru' => 'tanda_baca',
            'tanda-tanya' => 'tanda_baca',
            'tanda-titik' => 'tanda_baca',
            'tanda-koma' => 'tanda_baca',
            'tanda-sisipan' => 'tanda_baca',

            // kata
            'kata-depan' => 'kata_depan',
            'kata-ganti' => 'kata_ganti',
            'kata-majemuk' => 'kata_majemuk',
            'kata-kerja' => 'kata_kerja',
            'kata-sambung' => 'kata_sambung',
            'kata-bilangan' => 'angka',
            'kata-ulang' => 'kata_majemuk',

            // singkatan dan akronim
            'singkatan-dan-akronim' => 'singkatan',
            'singkatan' => 'singkatan',
            'akronim' => 'singkatan',

            // penulisan
            'penulisan-angka' => 'angka',
            'penulisan-gelar' => 'gelar',
            'penulisan-nama' => 'nama_orang',
            'penulisan-tempat' => 'nama_tempat',
            'penulisan-waktu' => 'unit_waktu',
            'penulisan-lembaga' => 'lembaga',
            'penulisan-jabatan' => 'jabatan',

            // ejaan
            'ejaan' => 'ejaan',
            'pemenggalan' => 'ejaan',
            'imbuhan' => 'kata_kerja',

            // fallback
            'default' => 'default',
        ];

        foreach ($entries as $e) {
            $slug = $e->slug;
            $md = $e->content_markdown ?? '';
            $title = $e->title ?? $slug;

            // ambil contoh kata
            $examples = $this->extractExamplesFromText($md);
            if (empty($examples)) $examples = [$title];

            foreach ($examples as $val) {
                $val = trim($val);
                if ($val === '') continue;

                $category = $this->detectCategory($slug, $val, $md, $slugCategoryMap);

                DB::table('rule_entries')->updateOrInsert(
                    ['rule_id' => $slug, 'category' => $category, 'value' => $val],
                    [
                        'value_normalized' => mb_strtolower($val),
                        'note' => 'Auto (Ultimate Heuristik)',
                        'created_at' => $now,
                        'updated_at' => $now
                    ]
                );
                $inserted++;
            }
        }

        $this->command->info("✅ Seeder selesai. Total data diinsert/update: {$inserted}");
    }

    protected function detectCategory(string $slug, string $value, string $context, array $slugCategoryMap): string
    {
        $vLower = mb_strtolower($value);
        $ctxLower = mb_strtolower($context);

        // ===== 1️⃣ Berdasarkan peta slug =====
        if (isset($slugCategoryMap[$slug])) {
            return $slugCategoryMap[$slug];
        }

        // ===== 2️⃣ Berdasarkan konteks di markdown =====
        if (preg_match('/\b(nama orang|tokoh|julukan)\b/u', $ctxLower)) return 'nama_orang';
        if (preg_match('/\b(tempat|wilayah|kota|negara|jalan)\b/u', $ctxLower)) return 'nama_tempat';
        if (preg_match('/\b(organisasi|lembaga|instansi|universitas|badan|perusahaan)\b/u', $ctxLower)) return 'lembaga';
        if (preg_match('/\b(gelar|jabatan)\b/u', $ctxLower)) return 'gelar';
        if (preg_match('/\b(istilah khusus|bidang ilmu|terminologi)\b/u', $ctxLower)) return 'istilah_khusus';
        if (preg_match('/\b(judul|karya|film|buku|majalah)\b/u', $ctxLower)) return 'judul_karya';
        if (preg_match('/\b(gabungan kata|kata majemuk)\b/u', $ctxLower)) return 'kata_majemuk';
        if (preg_match('/\b(kata depan|preposisi)\b/u', $ctxLower)) return 'kata_depan';
        if (preg_match('/\b(kata kerja|imbuhan|berimbuhan)\b/u', $ctxLower)) return 'kata_kerja';
        if (preg_match('/\b(angka|bilangan|nomor)\b/u', $ctxLower)) return 'angka';
        if (preg_match('/\b(waktu|hari|bulan|tahun|abad)\b/u', $ctxLower)) return 'unit_waktu';
        if (preg_match('/\b(tanda baca|tanda seru|tanda titik|tanda koma)\b/u', $ctxLower)) return 'tanda_baca';
        if (preg_match('/\b(ejaan|penulisan)\b/u', $ctxLower)) return 'ejaan';

        // ===== 3️⃣ Berdasarkan pola bentuk kata =====
        if (preg_match('/^[A-Z][a-z]+( [A-Z][a-z]+)*$/u', $value)) {
            return (str_word_count($value) > 1) ? 'nama_tempat' : 'nama_orang';
        }
        if (preg_match('/^[A-Z]{2,}$/u', $value)) return 'singkatan';
        if (str_word_count($value) > 1) return 'kata_majemuk';
        if (preg_match('/^[a-z]{1,2}$/u', $value)) return 'huruf';
        if (preg_match('/\d/', $value)) return 'angka';

        // ===== 4️⃣ Berdasarkan clue kalimat sekitar =====
        if (preg_match('/\b(di|ke|dari|pada|antara)\b/u', $ctxLower)) return 'kata_depan';
        if (preg_match('/["“][^"”]+["”]/u', $context)) return 'judul_karya';
        if (preg_match('/\b(adalah singkatan dari|berasal dari kata)\b/u', $ctxLower)) return 'singkatan';
        if (preg_match('/\b(nama jalan|jalan)\b/u', $ctxLower)) return 'nama_tempat';

        // ===== 5️⃣ Fallback =====
        return 'default';
    }

    protected function extractExamplesFromText(string $txt): array
    {
        // Bersihkan HTML & normalisasi
        $txt = strip_tags($txt);
        $txt = str_replace(["\r\n", "\r"], "\n", $txt);
        $out = [];

        // 1️⃣ Cari "Contoh:" / "Misalnya:"
        if (preg_match_all('/(?:Contoh|Misalnya|contoh|misalnya)[:\s]*([^\n]+)/u', $txt, $m)) {
            foreach ($m[1] as $line) {
                $parts = preg_split('/[;,]/', $line);
                foreach ($parts as $p) {
                    $p = trim(preg_replace('/[*_`~"\'…]+/u', '', $p));
                    if ($p !== '') $out[] = $p;
                }
            }
        }

        // 2️⃣ Bullet list markdown
        if (preg_match_all('/^[ \t]*[-\*\+]\s*(.+)$/m', $txt, $m2)) {
            foreach ($m2[1] as $l) {
                $p = trim(preg_replace('/[*_`~"\'…]+/u', '', $l));
                if ($p !== '') $out[] = $p;
            }
        }

        // 3️⃣ Tabel markdown
        if (preg_match_all('/\|(.+)\|/m', $txt, $t)) {
            foreach ($t[1] as $row) {
                $cells = array_map('trim', explode('|', $row));
                foreach ($cells as $c) {
                    if ($c !== '') $out[] = $c;
                }
            }
        }

        // 4️⃣ Fallback: baris pendek tanpa titik
        if (preg_match_all('/^[^\-\*\|#][A-Za-z0-9\s\-\(\)\/]{2,100}$/m', $txt, $lines)) {
            foreach ($lines[0] as $l) {
                $line = trim($l);
                if ($line !== '' && !str_contains($line, '.')) {
                    $out[] = $line;
                }
            }
        }

        // 5️⃣ Filter akhir
        $out = array_unique(array_filter($out, function ($s) {
            $len = mb_strlen($s);
            return $len > 1 && $len <= 150;
        }));

        return array_values($out);
    }
}