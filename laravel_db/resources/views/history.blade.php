@extends('layouts.app')

@section('content')
<div class="min-h-screen bg-[#e8e8e8] relative overflow-hidden">
    
    {{-- Header/Navbar --}}
    <header class="bg-gradient-to-r from-[#4a4a6a] via-[#5a6080] to-[#6a7a9a] shadow-lg relative z-20">
        <div class="max-w-full mx-auto py-5 px-8 flex justify-between items-center relative">

            {{-- Logo --}}
            <div class="flex items-center gap-3 relative">
                <img src="{{ asset('images/ikon-logo.png') }}" alt="Logo" class="w-12 h-12">
            </div>

            {{-- Judul Tengah --}}
            <h1 class="text-4xl font-extrabold bg-gradient-to-r from-[#0A0A2E] via-[#1E3A8A] to-[#3B82F6] bg-clip-text text-transparent drop-shadow-md tracking-wide">
                Tata Kata.
            </h1>

            {{-- User Menu --}}
            <div class="flex items-center gap-4">
                {{-- Profile --}}
                <a href="{{ route('profile.edit') }}" class="relative flex items-center group">
                    <svg class="w-9 h-9 text-white group-hover:text-blue-200 transition" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                    <div class="absolute top-full right-0 mt-2 px-3 py-2 bg-gray-800 text-white text-sm rounded-lg shadow-lg opacity-0 group-hover:opacity-100 transition-opacity duration-200 pointer-events-none whitespace-nowrap z-50">
                        {{ Auth::user()->first_name . ' ' . Auth::user()->last_name ?? 'Profil' }}
                        <div class="absolute -top-1 right-3 w-2 h-2 bg-gray-800 transform rotate-45"></div>
                    </div>
                </a>

                {{-- Logout --}}
                <form method="POST" action="{{ route('logout') }}" class="relative group">
                    @csrf
                    <button type="submit" class="flex items-center justify-center w-9 h-9 hover:bg-white/10 rounded-full transition">
                        <svg class="w-9 h-9 text-white group-hover:text-blue-200 transition" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                  d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a2 2 0 01-2 2H5a2 2 0 01-2-2V7a2 2 0 012-2h6a2 2 0 012 2v1"/>
                        </svg>
                    </button>
                    <div class="absolute top-full right-0 mt-2 px-3 py-2 bg-gray-800 text-white text-sm rounded-lg shadow-lg opacity-0 group-hover:opacity-100 transition-opacity duration-200 whitespace-nowrap">
                        Keluar
                        <div class="absolute -top-1 right-3 w-2 h-2 bg-gray-800 transform rotate-45"></div>
                    </div>
                </form>
            </div>
        </div>
    </header>

    {{-- Background --}}
    <div class="relative w-full min-h-[calc(100vh-88px)] bg-gradient-to-br from-[#f1f1f8] via-[#e6e8f0] to-[#d6dae8] overflow-hidden">

        {{-- Semburan pink lembut kanan atas --}}
        <div class="absolute -top-48 -right-48 w-[900px] h-[900px] 
                    bg-gradient-to-br from-[#FFEAF1]/70 via-[#FFD9E0]/50 to-[#FFF4F7]/40 
                    rounded-full blur-[220px] pointer-events-none"></div>

        {{-- Semburan putih glossy kiri bawah --}}
        <div class="absolute -bottom-20 -left-20 w-[550px] h-[550px] bg-white/50 rounded-full blur-[150px] pointer-events-none"></div>

        {{-- Elemen 1 --}}
        <div class="absolute top-0 right-0 w-[320px] h-[320px] opacity-30 pointer-events-none">
            <img src="{{ asset('images/elemen-1.png') }}" alt="Elemen 1" class="w-full h-full object-contain object-right">
        </div>

        {{-- Elemen 2 --}}
        <div class="absolute bottom-0 left-0 w-[550px] h-[550px] opacity-30 pointer-events-none -translate-x-8 mb-[-2px]">
            <img src="{{ asset('images/elemen-2.png') }}" alt="Elemen 2" class="w-full h-full object-contain object-left-bottom">
        </div>

        {{-- Konten Utama --}}
        <main class="relative z-10 max-w-6xl mx-auto px-8 sm:px-12 lg:px-16 py-12 flex flex-col min-h-[calc(100vh-88px)]">

            {{-- Breadcrumb / Beranda --}}
            <a href="{{ route('dashboard') }}" 
                class="block mb-8 text-2xl font-semibold text-[#1a1a2e]/80 hover:underline">
                Beranda
            </a>

            {{-- Judul --}}
            <h1 class="text-4xl md:text-5xl font-bold text-[#1a1a2e] mb-10 text-center">
                Riwayat Pemeriksaan
            </h1>

            {{-- Kotak Riwayat (silver glossy + border navy glossy) --}}
            <div class="bg-gradient-to-br from-[#d9d9d9]/90 via-[#e4e4e4]/80 to-[#cfcfcf]/90 backdrop-blur-md 
                        rounded-[2rem] p-10 md:p-12 shadow-2xl border-[2px] border-[#2a3a5a]/70
                        text-gray-900 flex-1 flex flex-col">

                {{-- Menggunakan $history dari Controller yang digabungkan --}}
                @if(isset($history) && $history->count() > 0)
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        @foreach($history as $item)
                        
                            {{-- Tentukan URL Koreksi dan Nama menggunakan notasi array --}}
                            @php
                                // Mengakses properti sebagai array karena telah di-map di Controller
                                $isDocument = $item['type'] === 'document';
                                $name = $item['name'];
                                $status = ucfirst($item['upload_status'] ?? 'Selesai');
                                $createdAt = $item['created_at']->format('d M Y, H:i');
                                
                                if ($isDocument) {
                                    $correctionUrl = route('correction.show', $item['id']);
                                    $downloadUrl = asset('storage/'.$item['file_location']);
                                    $typeBadge = 'Dokumen';
                                } else {
                                    $correctionUrl = route('text.correction.show', $item['id']);
                                    $downloadUrl = null; 
                                    $typeBadge = 'Teks';
                                }
                            @endphp

                        <div class="bg-white/60 backdrop-blur-sm rounded-2xl p-6 shadow-md hover:shadow-lg transition-all duration-300 border border-[#2a3a5a]/50">
                            <div class="flex flex-col gap-3">
                                <span class="text-xs font-bold uppercase text-blue-600/80">{{ $typeBadge }}</span>
                                <h3 class="text-xl font-semibold text-[#1a1a2e] truncate">{{ $name }}</h3>
                                
                                <div class="flex flex-wrap gap-4 text-sm text-gray-700">
                                    <span class="flex items-center gap-1">
                                        <svg class="w-4 h-4 text-gray-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                        {{ $createdAt }}
                                    </span>
                                    <span class="flex items-center gap-1">
                                        <svg class="w-4 h-4 text-gray-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4"/>
                                        </svg>
                                        {{ $status }}
                                    </span>
                                </div>
                                
                                <div class="flex gap-3 mt-2">
                                    {{-- Tombol Lihat Hasil --}}
                                    <a href="{{ $correctionUrl }}" 
                                       class="px-5 py-2 bg-white text-gray-900 rounded-full hover:bg-gray-100 transition font-semibold text-sm">
                                        Lihat Hasil
                                    </a>
                                    
                                    @if($downloadUrl)
                                    {{-- Tombol Unduh File --}}
                                    <a href="{{ $downloadUrl }}" download
                                       class="px-5 py-2 bg-gray-100 text-gray-900 rounded-full hover:bg-gray-200 transition font-semibold text-sm">
                                        Unduh File
                                    </a>
                                    @endif

                                    {{-- Tombol Hapus (Baru Ditambahkan) --}}
                                    <form method="POST" action="{{ route('history.delete') }}" 
                                          onsubmit="return confirm('Apakah Anda yakin ingin menghapus riwayat \'{{ $name }}\'? Tindakan ini tidak bisa dibatalkan.');">
                                        @csrf
                                        @method('DELETE')
                                        <input type="hidden" name="item_id" value="{{ $item['id'] }}">
                                        <input type="hidden" name="item_type" value="{{ $item['type'] }}">
                                        
                                        <button type="submit"
                                                class="px-3 py-2 bg-red-500 text-white rounded-full hover:bg-red-600 transition shadow-md">
                                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3m-4 0h10"/>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                @else
                    <div class="flex flex-col items-center justify-center text-center text-[#1a1a2e] h-full">
                        <svg class="w-20 h-20 text-gray-500/60 mb-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        <p class="text-lg mb-6 italic">Belum ada riwayat pemeriksaan. Silakan unggah atau periksa teks.</p>
                        <a href="{{ route('upload') }}" 
                           class="px-8 py-2 bg-white text-gray-900 rounded-full font-semibold text-lg hover:bg-gray-100 transition-all duration-200 shadow-lg">
                            Mulai Pemeriksaan
                        </a>
                    </div>
                @endif
            </div>

            {{-- Tombol Mengambang --}}
            <div class="fixed bottom-8 right-8 z-50">
                <a href="{{ route('upload') }}" 
                   class="flex items-center gap-3 px-6 py-3 bg-white border-2 border-[#2a3a5a] text-gray-900 rounded-full hover:bg-gray-50 transition-all duration-200 font-semibold shadow-xl hover:shadow-2xl">
                    <span class="hidden sm:inline">Unggah dokumen</span>
                    <span class="sm:hidden">Unggah</span>
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M12 4v16m8-8H4"/>
                    </svg>
                </a>
            </div>

        </main>
    </div>
</div>
@endsection
