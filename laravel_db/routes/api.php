<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FastAPIController;

Route::post('/correct-text', [FastAPIController::class, 'checkHybrid']);
Route::post('/correct-pdf', [FastAPIController::class, 'uploadPDF']);
Route::post('/predict-ai', [FastAPIController::class, 'predictAI']);
Route::post('/predict', [FastAPIController::class, 'predictMask']);
Route::get('/puebi/{slug}', [FastAPIController::class, 'getReference']);