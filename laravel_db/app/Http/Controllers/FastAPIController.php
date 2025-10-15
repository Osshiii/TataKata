<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FastAPIController extends Controller
{
    private $fastApiBase;

    public function __construct()
    {
        $this->fastApiBase = env('AI_URL');
    }

    /**
     * Send text for hybrid grammar + AI checking
     */
    public function checkHybrid(Request $request)
    {
        $text = $request->input('text');

        $response = Http::post("{$this->fastApiBase}/api/check-hybrid", [
            'text' => $text,
        ]);

        return $response->json();
    }

    /**
     * Upload PDF file to FastAPI
     */
    public function uploadPDF(Request $request)
    {
        $file = $request->file('file');

        if (!$file) {
            return response()->json(['error' => 'No file uploaded'], 400);
        }

        $response = Http::attach(
            'file',
            file_get_contents($file->getRealPath()),
            $file->getClientOriginalName()
        )->post("{$this->fastApiBase}/api/upload-pdf");

        return $response->json();
    }

    /**
     * Get AI prediction (custom ai_predict)
     */
    public function predictAI(Request $request)
    {
        $text = $request->input('text');

        $response = Http::post("{$this->fastApiBase}/api/predict-ai", [
            'text' => $text,
        ]);

        return $response->json();
    }

    /**
     * Get fill-mask model result (HuggingFace pipeline)
     */
    public function predictMask(Request $request)
    {
        $text = $request->input('text');

        $response = Http::post("{$this->fastApiBase}/api/predict", [
            'text' => $text,
        ]);

        return $response->json();
    }

    /**
     * Get PUEBI reference by slug
     */
    public function getReference($slug)
    {
        $response = Http::get("{$this->fastApiBase}/api/puebi/{$slug}");
        return $response->json();
    }
}
