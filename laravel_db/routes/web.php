<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\FastAPIController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/upload', [DocumentController::class, 'uploadForm'])->name('upload');
    Route::post('/upload', [DocumentController::class, 'upload'])->name('upload.post');
    Route::post('/check-hybrid', [FastAPIController::class, 'checkHybrid'])->name('checkhybrid');
    Route::post('/predict', [FastAPIController::class, 'predictMask'])->name('predict');
    Route::get('/history', [DocumentController::class, 'history'])->name('history');
    Route::get('/correction/{document}', [DocumentController::class, 'showCorrection'])->name('correction.show');
});


require __DIR__.'/auth.php';