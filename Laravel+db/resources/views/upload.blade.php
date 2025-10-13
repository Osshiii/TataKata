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
                Unggah Dokumen
            </h1>
        </div>

        {{-- Upload Form Card --}}
        <div class="max-w-4xl mx-auto">
            <div class="bg-gradient-to-br from-indigo-800 via-indigo-700 to-blue-600 rounded-3xl p-8 md:p-12 shadow-2xl">
                
                <form method="POST" action="{{ route('upload.post') }}" enctype="multipart/form-data" class="space-y-8">
                    @csrf

                    {{-- Document Name Input --}}
                    <div>
                        <input type="text" 
                               name="document_name" 
                               id="document_name"
                               placeholder="Nama Dokumen"
                               required
                               class="w-full px-6 py-4 bg-gray-100 text-gray-900 rounded-2xl text-lg focus:outline-none focus:ring-4 focus:ring-indigo-300 placeholder-gray-500"
                               value="{{ old('document_name') }}">
                        @error('document_name')
                            <p class="text-red-300 text-sm mt-2">{{ $message }}</p>
                        @enderror
                    </div>

                    {{-- File Upload Area --}}
                    <div class="bg-gray-100 rounded-2xl p-8 md:p-12 text-center relative">
                        <input type="file" 
                               name="document" 
                               id="document"
                               accept=".pdf,.doc,.docx"
                               required
                               class="absolute inset-0 w-full h-full opacity-0 cursor-pointer z-10"
                               onchange="updateFileName(this)">
                        
                        <div class="pointer-events-none">
                            <div class="mb-6">
                                <svg class="w-20 h-20 mx-auto text-gray-900" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                                </svg>
                            </div>
                            <p class="text-gray-600 text-lg" id="file-label">Tarik & lepas dokumen disini</p>
                            <p class="text-gray-500 text-sm mt-2">atau klik untuk memilih file</p>
                            <p class="text-gray-400 text-xs mt-2">Format: PDF, DOC, DOCX (Max: 10MB)</p>
                        </div>
                    </div>

                    @error('document')
                        <p class="text-red-300 text-sm">{{ $message }}</p>
                    @enderror

                    {{-- Action Buttons --}}
                    <div class="flex flex-col sm:flex-row gap-4 justify-between items-center pt-4">
                        <a href="{{ route('dashboard') }}" 
                           class="w-full sm:w-auto px-12 py-3 bg-white text-gray-900 rounded-full font-semibold text-lg hover:bg-gray-100 transition-all duration-200 shadow-lg text-center">
                            Batal
                        </a>
                        
                        <button type="submit" 
                                class="w-full sm:w-auto px-12 py-3 bg-white text-gray-900 rounded-full font-semibold text-lg hover:bg-gray-100 transition-all duration-200 shadow-lg">
                            Unggah dan periksa
                        </button>
                    </div>

                </form>

            </div>
        </div>

        {{-- Success Message --}}
        @if(session('success'))
        <div class="mt-8 max-w-4xl mx-auto">
            <div class="bg-green-100 border border-green-400 text-green-700 px-6 py-4 rounded-lg">
                {{ session('success') }}
            </div>
        </div>
        @endif

        {{-- Error Message --}}
        @if(session('error'))
        <div class="mt-8 max-w-4xl mx-auto">
            <div class="bg-red-100 border border-red-400 text-red-700 px-6 py-4 rounded-lg">
                {{ session('error') }}
            </div>
        </div>
        @endif

    </main>

</div>

<script>
function updateFileName(input) {
    const label = document.getElementById('file-label');
    if (input.files && input.files[0]) {
        label.textContent = input.files[0].name;
    } else {
        label.textContent = 'Tarik & lepas dokumen disini';
    }
}

// Drag and drop functionality
const dropArea = document.querySelector('.bg-gray-100.rounded-2xl');
const fileInput = document.getElementById('document');

['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, preventDefaults, false);
});

function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
}

['dragenter', 'dragover'].forEach(eventName => {
    dropArea.addEventListener(eventName, highlight, false);
});

['dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, unhighlight, false);
});

function highlight(e) {
    dropArea.classList.add('border-4', 'border-indigo-400', 'bg-gray-200');
}

function unhighlight(e) {
    dropArea.classList.remove('border-4', 'border-indigo-400', 'bg-gray-200');
}

dropArea.addEventListener('drop', handleDrop, false);

function handleDrop(e) {
    const dt = e.dataTransfer;
    const files = dt.files;
    
    fileInput.files = files;
    updateFileName(fileInput);
}
</script>
@endsection