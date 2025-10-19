<?php

namespace App\Http\Controllers;

use App\Models\Document;
use App\Models\History;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class DocumentController extends Controller {

    public function uploadForm() {
        return view('upload');
    }

    public function upload(Request $request) {
        $request->validate([
            'document' => 'required|file|mimes:pdf,doc,docx,txt|max:10240',
        ]);

        $file = $request->file('document');
        $filename = time().'_'.$file->getClientOriginalName();
        $path = $file->storeAs('documents', $filename, 'public');

        $document = Document::create([
            'user_id' => Auth::id(),
            'file_name' => $file->getClientOriginalName(),
            'file_location' => $path,
            'upload_status' => 'Uploaded',
        ]);

        History::create([
            'user_id' => Auth::id(),
            'document_id' => $document->id,
            'activity_type' => 'upload',
            'details' => 'Dokumen diunggah oleh user',
        ]);

        // new rosi
        // return redirect()->route('history')->with('success', 'Dokumen berhasil diunggah!');
        return redirect()->route('correction.show', $document->id)->with('success', 'Dokumen berhasil diunggah!');

    }

    public function history()
    {
        $documents = Document::where('user_id', auth()->id())->paginate(10);
        return view('history', compact('documents'));
    }

    // new rosi
    public function showCorrection(Document $document)
    {
    // sementara bikin kotak dummy dulu
    $corrected_text = "Hasil koreksi akan tampil di sini setelah integrasi FastAPI.";

    return view('correction', compact('document', 'corrected_text'));
    }

}
