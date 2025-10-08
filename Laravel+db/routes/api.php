<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AnalyzeController;

Route::post('/analyze', [AnalyzeController::class, 'analyze']);