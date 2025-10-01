@extends('layouts.app')

@section('content')
<div class="min-h-screen flex flex-col bg-gradient-to-b from-gray-50 to-white">

    {{-- Navbar atas --}}
    <header class="flex justify-between items-center px-6 py-4 bg-gradient-to-r from-indigo-700 to-indigo-500 text-white rounded-b-lg">
        <div class="flex items-center space-x-3">
            <x-heroicon-o-document-text class="w-6 h-6"/>
            <span class="font-semibold">Beranda</span>
        </div>
        <div class="flex items-center space-x-4">
            <x-heroicon-o-user-circle class="w-7 h-7"/>
            <x-heroicon-o-dots-horizontal class="w-6 h-6"/>
        </div>
    </header>

    {{-- Konten Utama --}}
    <main class="flex flex-col items-center justify-center flex-1 text-center px-4 py-12">
        <h1 class="text-2xl md:text-3xl font-semibold text-gray-800">
            Selamat datang di,<br>
            <span class="font-extrabold text-indigo-700 text-3xl md:text-4xl">Tata Kata.</span>
        </h1>

        {{-- Tombol Aksi --}}
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-12">
            {{-- Upload Dokumen --}}
            <a href="{{ route('upload') }}" 
               class="bg-gradient-to-r from-indigo-600 to-indigo-400 w-56 h-48 rounded-2xl flex flex-col items-center justify-center text-white shadow-lg hover:scale-105 transition">
                <span class="text-lg font-bold">Unggah<br>Dokumen</span>
                <x-heroicon-o-plus class="w-10 h-10 mt-4"/>
            </a>

            {{-- Riwayat --}}
            <a href="{{ route('history') }}" 
               class="bg-gradient-to-r from-indigo-600 to-indigo-400 w-56 h-48 rounded-2xl flex flex-col items-center justify-center text-white shadow-lg hover:scale-105 transition">
                <span class="text-lg font-bold">Riwayat</span>
                <x-heroicon-o-clock class="w-10 h-10 mt-4"/>
            </a>
        </div>
    </main>
</div>
@endsection
