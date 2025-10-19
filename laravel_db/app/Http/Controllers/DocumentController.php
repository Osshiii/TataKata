<?php
namespace App\Http\Controllers;

use App\Models\Document;
use App\Models\History;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Http;

class DocumentController extends Controller
{
    // Form upload
    public function uploadForm()
    {
        return view('upload');
    }

    // Upload file ke storage dan DB
    public function upload(Request $request)
    {
        $request->validate([
            'document_name' => 'required|string',
            'file' => 'required|file|mimes:pdf,doc,docx,txt|max:10240',
        ]);

        $file = $request->file('file');
        $document_name = $request->input('document_name');

        $originalName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $extension = $file->getClientOriginalExtension();
        $cleanName = preg_replace('/[^A-Za-z0-9_-]/', '_', $originalName);
        $filename = time() . '_' . $cleanName . '.' . $extension;

        $path = $file->storeAs('documents', $filename, 'public');

        $document = Document::create([
            'user_id' => Auth::id(),
            'file_name' => $document_name,
            'file_location' => $path,
            'upload_status' => 'Uploaded',
        ]);

        History::create([
            'user_id' => Auth::id(),
            'document_id' => $document->id,
            'activity_type' => 'upload',
            'details' => 'Dokumen diunggah oleh user',
        ]);

        return redirect()->route('correction.show', $document->id)
                         ->with('success', 'Dokumen berhasil diunggah!');
    }

    // Tampilkan halaman koreksi dan ambil hasil dari FastAPI
    public function showCorrection(Document $document)
    {
    $file_path = storage_path("app/public/{$document->file_location}");

    if (!file_exists($file_path)) {
        return redirect()->route('upload')->with('error', 'File tidak ditemukan.');
    }

    // Kirim file PDF ke FastAPI
    try {
        $response = Http::attach(
            'file',
            file_get_contents($file_path),
            $document->file_name . '.pdf' // pastikan nama file unik
        )->post(env('AI_URL') . '/api/correct-pdf');

        // $data = $response->json();
        // $corrected_text = $data['corrected_text'] ?? ($data['message'] ?? 'Gagal koreksi dari FastAPI');
        $data = $response->json();
        $original_text = $data['original_text'] ?? '-';
        $corrected_text = $data['corrected_text'] ?? ($data['message'] ?? 'Gagal koreksi dari FastAPI');
    } catch (\Exception $e) {
        $corrected_text = "Gagal menghubungi FastAPI: " . $e->getMessage();
    }

    return view('correction', compact('document', 'original_text', 'corrected_text'));
    }

    // Riwayat dokumen user
    public function history()
    {
        $documents = Document::where('user_id', Auth::id())->paginate(10);
        return view('history', compact('documents'));
    }

    public function download($id)
    {
        $document = Document::findOrFail($id);

        // Cek apakah dokumen milik user yang sedang login
        if ($document->user_id !== Auth::id()) {
            abort(403, 'Anda tidak memiliki akses ke file ini.');
        }

        $path = storage_path('app/public/' . $document->file_location);

        if (!file_exists($path)) {
            return back()->with('error', 'File tidak ditemukan.');
        }

        return response()->download($path, $document->file_name . '.' . pathinfo($path, PATHINFO_EXTENSION));
    }
}
