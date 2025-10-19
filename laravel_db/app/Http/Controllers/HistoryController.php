<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Document;
use App\Models\TextEntry;
use Illuminate\View\View;
use Illuminate\Support\Collection; // Penting untuk tipe data

class HistoryController extends Controller
{
    protected $middleware = ['auth'];

    public function index(): View
    {
        $userId = Auth::id();

        // 1. Ambil Dokumen dan standardisasi formatnya
        $documents = Document::where('user_id', $userId)
                             ->get()
                             ->map(function ($doc) {
                                 return [
                                     'id' => $doc->id,
                                     'type' => 'document',
                                     'created_at' => $doc->created_at,
                                     'name' => $doc->file_name,
                                     'upload_status' => $doc->upload_status,
                                     'file_location' => $doc->file_location, // Khusus Dokumen
                                 ];
                             });

        // 2. Ambil Entri Teks dan standardisasi formatnya
        $textEntries = TextEntry::where('user_id', $userId)
                                 ->get()
                                 ->map(function ($entry) {
                                     return [
                                         'id' => $entry->id,
                                         'type' => 'text',
                                         'created_at' => $entry->created_at,
                                         'name' => $entry->title ?? 'Entri Teks',
                                         'upload_status' => $entry->upload_status,
                                         'file_location' => null, // Dibuat null agar konsisten
                                     ];
                                 });

        // 3. Gabungkan dan urutkan
        // Kita menggunakan Collection::merge() dan sortByDesc() pada array standar
        $history = $documents->merge($textEntries)
                             ->sortByDesc('created_at');

        // 4. Kirim sebagai $history
        return view('history', compact('history'));
    }
}
