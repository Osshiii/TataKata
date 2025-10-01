@extends('layouts.app')
@extends('layouts.landing')

@section('content')
<h1>Selamat datang di Tata Kata</h1>
<div class="min-h-screen bg-gradient-to-b from-gray-50 to-white flex flex-col">

    {{-- Navbar --}}
    <header class="flex justify-between items-center px-8 py-4 bg-gradient-to-r from-indigo-700 to-indigo-500 rounded-b-lg">
        <div class="space-x-3">
            <a href="{{ route('login') }}" class="px-4 py-2 border border-white text-white rounded-full hover:bg-white hover:text-indigo-600 transition">Masuk</a>
            <a href="{{ route('register') }}" class="px-4 py-2 border border-white text-white rounded-full hover:bg-white hover:text-indigo-600 transition">Daftar</a>
        </div>
    </header>

    {{-- Hero --}}
    <main class="flex flex-col md:flex-row items-center justify-between flex-1 px-12 py-16">
        <div class="max-w-xl space-y-6">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900">Periksa Kata, Sempurnakan Bahasa</h2>
            <h1 class="text-5xl font-extrabold text-indigo-700">Tata Kata.</h1>
            <p class="text-gray-600 leading-relaxed">
                Tingkatkan kualitas tulisan tugas akhir Anda dengan koreksi otomatis tata bahasa, ejaan, dan gaya penulisan menggunakan teknologi AI.
            </p>

            {{-- Fitur --}}
            <div class="grid grid-cols-2 gap-4 mt-8">
                <div class="bg-indigo-700 text-white text-center p-6 rounded-2xl shadow-md">Pemrosesan Bahasa Berbasis AI</div>
                <div class="bg-indigo-700 text-white text-center p-6 rounded-2xl shadow-md">Semua Fitur Gratis</div>
                <div class="bg-indigo-700 text-white text-center p-6 rounded-2xl shadow-md col-span-2">Kompatibilitas</div>
            </div>
        </div>

        {{-- Ilustrasi kanan --}}
        <div class="mt-10 md:mt-0 md:ml-12">
            <img src="{{ asset('images/logo-tatakata.png') }}" alt="Logo Tata Kata" class="w-[400px] drop-shadow-2xl">
        </div>
    </main>
</div>
@endsection
