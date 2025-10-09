@extends('layouts.app')

@section('content')
<div class="min-h-screen bg-gradient-to-b from-gray-50 to-white flex flex-col">

    {{-- Navbar --}}
    <header class="flex justify-between items-center px-8 py-6 bg-gradient-to-r from-indigo-700 to-indigo-500 shadow-lg">
        <div class="text-2xl font-bold text-white">Tata Kata</div>
        <div class="space-x-4">
            <a href="{{ route('login') }}" class="px-6 py-2.5 border-2 border-white text-white rounded-full hover:bg-white hover:text-indigo-600 transition-all duration-300 font-medium">Masuk</a>
            <a href="{{ route('register') }}" class="px-6 py-2.5 bg-white text-indigo-600 rounded-full hover:bg-indigo-50 transition-all duration-300 font-medium shadow-md">Daftar</a>
        </div>
    </header>

    {{-- Hero Section --}}
    <main class="flex flex-col lg:flex-row items-center justify-between flex-1 px-8 md:px-16 lg:px-24 py-12 lg:py-20 gap-12">
        
        {{-- Konten Kiri --}}
        <div class="max-w-2xl space-y-8 flex-1">
            <div class="space-y-4">
                <h2 class="text-4xl md:text-5xl font-bold text-gray-900 leading-tight">Periksa Kata, Sempurnakan Bahasa</h2>
                <h1 class="text-6xl md:text-7xl font-extrabold text-indigo-700">Tata Kata.</h1>
            </div>
            
            <p class="text-lg md:text-xl text-gray-600 leading-relaxed">
                Tingkatkan kualitas tulisan tugas akhir Anda dengan koreksi otomatis tata bahasa, ejaan, dan gaya penulisan menggunakan teknologi AI.
            </p>

            {{-- Fitur Cards --}}
            <div class="grid grid-cols-1 md:grid-cols-2 gap-5 mt-10">
                <div class="bg-gradient-to-br from-indigo-700 to-indigo-600 text-white text-center p-8 rounded-3xl shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105">
                    <p class="font-semibold text-lg">Pemrosesan Bahasa Berbasis AI</p>
                </div>
                <div class="bg-gradient-to-br from-indigo-600 to-indigo-500 text-white text-center p-8 rounded-3xl shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105">
                    <p class="font-semibold text-lg">Semua Fitur Gratis</p>
                </div>
                <div class="bg-gradient-to-br from-indigo-500 to-indigo-400 text-white text-center p-8 rounded-3xl shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 md:col-span-2">
                    <p class="font-semibold text-lg">Kompatibilitas Penuh</p>
                </div>
            </div>
        </div>

        {{-- Ilustrasi Kanan - Lebih Besar --}}
        <div class="flex-1 flex items-center justify-center lg:justify-end">
            <div class="relative">
                {{-- Decorative background --}}
                <div class="absolute inset-0 bg-gradient-to-br from-indigo-200 to-purple-200 rounded-full blur-3xl opacity-30 animate-pulse"></div>
                
                {{-- Gambar Logo --}}
                <img src="{{ asset('images/logo-tatakata.png') }}" 
                     alt="Logo Tata Kata" 
                     class="relative w-[450px] md:w-[550px] lg:w-[650px] drop-shadow-2xl hover:scale-105 transition-transform duration-500">
            </div>
        </div>
    </main>

    {{-- Footer Wave (Optional) --}}
    <div class="mt-auto">
        <svg class="w-full h-24 fill-indigo-700" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z"></path>
        </svg>
    </div>
</div>
@endsection