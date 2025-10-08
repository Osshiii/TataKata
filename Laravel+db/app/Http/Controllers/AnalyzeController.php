<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class AnalyzeController extends Controller
{
    public function analyze(Request $request)
    {
        // Get user input (text or file)
        $text = $request->input('text');

        // Send to FastAPI
        $response = Http::post(env('AI_URL') . '/analyze', [
            'text' => $text,
        ]);

        // Return FastAPI’s response to frontend
        return response()->json($response->json());
    }
}
