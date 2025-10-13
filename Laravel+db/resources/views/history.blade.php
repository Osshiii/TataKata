@extends('layouts.app')

@section('content')
<div class="min-h-screen bg-gradient-to-br from-gray-100 via-blue-50 to-gray-100 relative overflow-hidden">
    
    {{-- Ornamen Kanan Atas --}}
    <div class="absolute top-0 right-0 w-1/2 h-96 opacity-20 pointer-events-none">
        <svg viewBox="0 0 400 400" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M50,0 Q100,50 100,100 T150,200 Q200,250 250,250 T350,350" stroke="#6366f1" stroke-width="3" fill="none" opacity="0.3"/>
            <path d="M100,0 Q150,50 150,100 T200,200 Q250,250 300,250 T400,350" stroke="#6366f1" stroke-width="3" fill="none" opacity="0.3"/>
            <path d="M150,0 Q200,50 200,100 T250,200 Q300,250 350,250 T450,350" stroke="#6366f1" stroke-width="3" fill="none" opacity="0.3"/>
            <path d="M200,0 Q250,50 250,100 T300,200 Q350,250 400,250 T500,350" stroke="#6366f1" stroke-width="3" fill="none" opacity="0.3"/>
        </svg>
    </div>

    {{-- Ornamen Kiri Bawah --}}
    <div class="absolute bottom-0 left-0 w-1/2 h-96 opacity-20 pointer-events-none">
        <svg viewBox="0 0 400 400" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,400 Q50,350 100,350 T200,300 Q250,250 300,250 T400,200" stroke="#6366f1" stroke-width="3" fill="none" opacity="0.3"/>
            <path d="M0,350 Q50,300 100,300 T200,250 Q250,200 300,200 T400,150" stroke="#6366f1" stroke-width="3" fill="none" opacity="0.3"/>
            <path d="M0,300 Q50,250 100,250 T200,200 Q250,150 300,150 T400,100" stroke="#6366f1" stroke-width="3" fill="none" opacity="0.3"/>
            <path d="M-50,350 Q0,300 50,300 T150,250 Q200,200 250,200 T350,150" stroke="#6366f1" stroke-width="3" fill="none" opacity="0.3"/>
        </svg>
    </div>

    {{-- Header/Navbar --}}
    <header class="bg-gradient-to-r from-gray-600 via-gray-700 to-blue-900 shadow-lg relative z-10">
        <div class="max-w-7xl mx-auto py-4 px-6 sm:px-8 lg:px-12 flex justify-between items-center">
            {{-- Logo --}}
            <div class="flex items-center gap-3">
                <svg class="w-10 h-10 text-blue-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4"/>
                </svg>
            </div>

            {{-- Title --}}
            <h1 class="text-2xl md:text-3xl font-bold text-white">Tata Kata.</h1>

            {{-- User Menu --}}
            <div class="flex items-center gap-4">
                {{-- Profile Icon --}}
                <a href="{{ route('profile.edit') }}" class="flex items-center space-x-2 group">
                    <svg class="w-8 h-8 text-white group-hover:text-blue-200 transition" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                    <span class="hidden sm:inline text-white font-medium group-hover:text-blue-200 transition">
                        Profile
                    </span>
                </a>

                {{-- Logout Button --}}
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit" 
                            class="flex items-center gap-2 px-4 py-2 bg-red-600 text-white rounded-full hover:bg-red-700 transition text-sm font-semibold shadow-md">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a2 2 0 01-2 2H5a2 2 0 01-2-2V7a2 2 0 012-2h6a2 2 0 012 2v1"/>
                        </svg>
                        <span class="hidden sm:inline">Logout</span>
                    </button>
                </form>
            </div>
        </div>
    </header>

    {{-- Main Content --}}
    <main class="relative z-10 max-w-7xl mx-auto px-6 sm:px-8 lg:px-12 py-12">
        
        {{-- Breadcrumb --}}
        <div class="mb-8">
            <a href="{{ route('dashboard') }}"
            <h3 class="text-2xl font-semibold text-indigo-900 border-b-2 border-indigo-900 inline-block pb-1">Beranda</h3>
            </a>
        </div>

        {{-- Page Title --}}
        <div class="text-center mb-12">
            <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-gray-900">
                Riwayat
            </h1>
        </div>

        {{-- Content Card --}}
        <div class="max-w-6xl mx-auto">
            <div class="bg-gray-50 border-2 border-gray-900 rounded-3xl p-8 md:p-12 min-h-[500px] shadow-lg">
                
                @if($documents && $documents->count() > 0)
                    {{-- Documents List --}}
                    <div class="space-y-4">
                        @foreach($documents as $doc)
                        <div class="bg-white rounded-xl p-6 shadow-md hover:shadow-lg transition-all duration-200 border border-gray-200">
                            <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                                <div class="flex-1">
                                    <h3 class="text-lg font-semibold text-gray-900 mb-2">{{ $doc->file_name }}</h3>
                                    <div class="flex flex-wrap gap-4 text-sm text-gray-600">
                                        <span class="flex items-center gap-1">
                                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                            </svg>
                                            {{ $doc->created_at->format('d M Y, H:i') }}
                                        </span>
                                        <span class="flex items-center gap-1">
                                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                            </svg>
                                            {{ $doc->upload_status ?? 'Selesai' }}
                                        </span>
                                    </div>
                                </div>
                                <div class="flex gap-3">
                                    <a href="{{ asset('storage/'.$doc->file_location) }}" 
                                       target="_blank"
                                       class="px-6 py-2 bg-indigo-700 text-white rounded-full hover:bg-indigo-800 transition-colors font-medium text-sm">
                                        Lihat
                                    </a>
                                    <a href="{{ asset('storage/'.$doc->file_location) }}" 
                                       download
                                       class="px-6 py-2 bg-gray-200 text-gray-900 rounded-full hover:bg-gray-300 transition-colors font-medium text-sm">
                                        Download
                                    </a>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>

                    {{-- Pagination --}}
                    @if($documents->hasPages())
                    <div class="mt-8">
                        {{ $documents->links() }}
                    </div>
                    @endif

                @else
                    {{-- Empty State --}}
                    <div class="flex flex-col items-center justify-center h-full min-h-[400px] text-center">
                        <svg class="w-24 h-24 text-gray-400 mb-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        <p class="text-xl text-gray-600 italic mb-8">
                            Belum ada riwayat pemeriksaan. Silakan unggah dokumen terlebih dahulu.
                        </p>
                        <a href="{{ route('upload') }}" 
                           class="inline-flex items-center gap-2 px-8 py-3 bg-white border-2 border-gray-900 text-gray-900 rounded-full hover:bg-gray-50 transition-all duration-200 font-semibold shadow-md">
                            <span>Unggah dokumen</span>
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                            </svg>
                        </a>
                    </div>
                @endif

            </div>
        </div>

        {{-- Floating Upload Button (Mobile/Bottom Right) --}}
        <div class="fixed bottom-8 right-8 z-50">
            <a href="{{ route('upload') }}" 
               class="flex items-center gap-3 px-6 py-3 bg-white border-2 border-gray-900 text-gray-900 rounded-full hover:bg-gray-50 transition-all duration-200 font-semibold shadow-xl hover:shadow-2xl">
                <span class="hidden sm:inline">Unggah dokumen</span>
                <span class="sm:hidden">Unggah</span>
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M12 4v16m8-8H4"/>
                </svg>
            </a>
        </div>

    </main>

</div>
@endsection