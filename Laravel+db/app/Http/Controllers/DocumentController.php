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
            'file' => 'required|file|mimes:pdf,doc,docx,txt|max:10240', // max 10MB
        ]);

        $file = $request->file('file');
        $filename = time().'_'.$file->getClientOriginalName();
        $path = $file->storeAs('documents', $filename, 'public');

        $document = Document::create([
            'user_id' => Auth::id(),
            'file_name' => $file->getClientOriginalName(),
            'file_location' => $path,
            'upload_status' => 'uploaded',
        ]);

        History::create([
            'user_id' => Auth::id(),
            'document_id' => $document->id,
            'activity_type' => 'upload',
            'details' => 'Dokumen diunggah oleh user',
        ]);

        return redirect()->route('history')->with('success', 'Dokumen berhasil diunggah!');
    }

    public function history() {
        $documents = Document::with('histories')->where('user_id', Auth::id())->get();
        return view('history', compact('documents'));
    }
}
