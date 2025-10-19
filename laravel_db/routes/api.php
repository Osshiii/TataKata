<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FastAPIController;

Route::post('/ai-check', [FastAPIController::class, 'predictAI']);
// Route::post('/predict', [FastAPIController::class, 'predictMask']);
Route::get('/puebi/{slug}', [FastAPIController::class, 'getReference']);