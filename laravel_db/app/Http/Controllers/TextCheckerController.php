<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use App\Models\TextEntry;
use Illuminate\View\View;

class TextCheckerController extends Controller
{
    // Menggunakan properti $middleware untuk melindungi seluruh controller.
    protected $middleware = ['auth'];

    public function index(): View
    {
        // Menampilkan view input teks
        return view('rulechecker'); 
    }

    /**
     * Proses input teks, simpan entri awal ke DB, dan alihkan ke halaman koreksi.
     */
    public function check(Request $request)
    {
        // 1. Validasi Input
        $validatedData = $request->validate([
            'title' => 'nullable|string|max:255',
            'content' => 'required|string|min:50', 
        ]);

        $userId = Auth::id();
        if (!$userId) {
            return redirect()->route('rule.checker')
                             ->with('error', 'Sesi autentikasi tidak valid. Silakan login kembali.');
        }

        // 2. Simpan Data Awal ke Database
        try {
            $entry = TextEntry::create([
                'user_id' => $userId,
                'title' => $validatedData['title'] ?? 'Teks Tanpa Judul',
                'content' => $validatedData['content'], 
                'upload_status' => 'uploaded',
            ]);

            // 3. Redirect ke halaman koreksi (showCorrection)
            return redirect()->route('text.correction.show', $entry)
                             ->with('success', 'Teks berhasil diunggah. Memuat hasil koreksi...');

        } catch (\Exception $e) {
            // Error jika gagal menyimpan ke DB
            \Log::error("DB Save Error in TextCheckerController: " . $e->getMessage());
            
            return redirect()->route('rule.checker')
                             ->with('error', 'Gagal menyimpan teks ke database. Error detail: ' . $e->getMessage());
        }
    }

    /**
     * Menampilkan halaman hasil koreksi untuk TextEntry (Memanggil API di sini).
     */
    public function showCorrection(TextEntry $textEntry): View
    {
        // Pemeriksaan kepemilikan
        if ($textEntry->user_id !== Auth::id()) {
            abort(403, 'Akses ditolak. Anda tidak memiliki izin untuk melihat entri ini.');
        }

        // Jika corrected_content sudah ada (sudah pernah diproses), langsung tampilkan
        if ($textEntry->upload_status === 'checked' || $textEntry->upload_status === 'clean') {
            $original_text = $textEntry->content; // DIUBAH ke snake_case
            $corrected_text = $textEntry->corrected_content ?? $textEntry->content; // DIUBAH ke snake_case
            
            // Variabel compatibility untuk view correction.blade.php
            $document = $textEntry; 
            
            return view('correction', compact('document', 'original_text', 'corrected_text'));
        }

        // --- PANGGIL API KOREKSI (Jika belum diproses) ---
        try {
            $apiUrl = env('AI_URL') . '/api/correct-text'; 
            
            $response = Http::timeout(30)->post($apiUrl, [
                'title' => $textEntry->title,
                'text' => $textEntry->content, // Kunci yang disepakati 'text'
            ]);

            if ($response->successful()) {
                $apiData = $response->json();
                
                $corrected_text = $apiData['corrected_text'] ?? $apiData['original_text']; // DIUBAH ke snake_case
                $status = isset($apiData['corrected_text']) ? 'corrected' : 'clean';

                // Update Database dengan hasil koreksi
                $textEntry->update([
                    'corrected_content' => $corrected_text,
                    'upload_status' => $status,
                ]);

            } elseif ($response->status() === 422) {
                $errorDetail = $response->json('detail') ? json_encode($response->json('detail')) : $response->body();
                throw new \Exception("API Koreksi menolak data (422). Detail: " . $errorDetail);
            } else {
                throw new \Exception("API gagal. Status: " . $response->status() . " Response: " . $response->body());
            }
            
            $original_text = $textEntry->content; // DIUBAH ke snake_case
            $document = $textEntry;

            // Tampilkan hasil
            return view('correction', compact('document', 'original_text', 'corrected_text'));

        } catch (\Exception $e) {
            // Error saat menghubungi API
            $corrected_text = "Gagal memproses koreksi. Error: " . $e->getMessage(); // DIUBAH ke snake_case
            $original_text = $textEntry->content; // DIUBAH ke snake_case
            $document = $textEntry;
            
            return view('correction', compact('document', 'original_text', 'corrected_text'));
        }
    }
}
