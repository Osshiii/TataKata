<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\TextCheckerController;
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
    Route::get('/history', [HistoryController::class, 'index'])->name('history');
    Route::delete('/history/delete', [HistoryController::class, 'delete'])->name('history.delete');
    Route::get('/checker', [TextCheckerController::class, 'index'])->name('rule.checker');
    Route::post('/checker', [TextCheckerController::class, 'check'])->name('rule.check');
    Route::get('/correction/{document}', [DocumentController::class, 'showCorrection'])->name('correction.show');
    Route::get('/correction/text/{textEntry}', [TextCheckerController::class, 'showCorrection'])->name('text.correction.show');
});

require __DIR__.'/auth.php';