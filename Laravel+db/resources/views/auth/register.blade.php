@extends('layouts.app')

@section('content')
<div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-gray-600 via-gray-700 to-blue-400 p-6">
    <div class="w-full max-w-5xl bg-gradient-to-br from-gray-600 via-gray-700 to-blue-400 rounded-[3rem] shadow-2xl overflow-hidden grid grid-cols-1 md:grid-cols-2 p-1">

        {{-- Bagian Kiri --}}
        <div class="flex flex-col justify-between p-12 bg-transparent text-white relative overflow-hidden">
            <div>
                <h1 class="text-5xl font-bold mb-12 text-blue-900">Tata Kata.</h1>
                
                <div class="flex items-start gap-4 mt-20">
                    <div class="flex-shrink-0">
                        <div class="w-16 h-16 rounded-full border-4 border-blue-800 flex items-center justify-center">
                            <svg class="w-8 h-8 text-blue-800" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                    </div>
                    <div>
                        <p class="text-xl font-medium text-gray-800 leading-relaxed">
                            Cara tercepat untuk<br>memeriksa dokumen<br>anda
                        </p>
                    </div>
                </div>
            </div>

            {{-- Ornamen Garis Melengkung --}}
            <div class="absolute bottom-0 left-0 w-48 h-48 opacity-20">
                <svg viewBox="0 0 200 200" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10,200 Q10,100 100,100 T100,0" stroke="white" stroke-width="2" fill="none" opacity="0.3"/>
                    <path d="M20,200 Q20,100 110,100 T110,0" stroke="white" stroke-width="2" fill="none" opacity="0.3"/>
                    <path d="M30,200 Q30,100 120,100 T120,0" stroke="white" stroke-width="2" fill="none" opacity="0.3"/>
                    <path d="M40,200 Q40,100 130,100 T130,0" stroke="white" stroke-width="2" fill="none" opacity="0.3"/>
                    <path d="M50,200 Q50,100 140,100 T140,0" stroke="white" stroke-width="2" fill="none" opacity="0.3"/>
                    <path d="M60,200 Q60,100 150,100 T150,0" stroke="white" stroke-width="2" fill="none" opacity="0.3"/>
                    <path d="M70,200 Q70,100 160,100 T160,0" stroke="white" stroke-width="2" fill="none" opacity="0.3"/>
                    <path d="M80,200 Q80,100 170,100 T170,0" stroke="white" stroke-width="2" fill="none" opacity="0.3"/>
                </svg>
            </div>
        </div>

        {{-- Bagian Kanan --}}
        <div class="p-10 flex flex-col justify-center bg-gray-50 rounded-[2.5rem] m-2">
            <h2 class="text-2xl font-bold text-gray-900 mb-8 text-center">Buat Akun</h2>
            
            {{-- Error Messages --}}
            @if ($errors->any())
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg mb-4">
                    <ul class="list-disc list-inside text-sm">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            {{-- Form Register --}}
            <form method="POST" action="{{ route('register') }}" class="space-y-4">
                @csrf
                
                <div>
                    <label for="first_name" class="block text-sm font-semibold text-gray-900 mb-2">Nama Depan</label>
                    <input id="first_name" 
                           type="text" 
                           name="first_name" 
                           value="{{ old('first_name') }}"
                           required 
                           autofocus 
                           class="mt-1 block w-full px-4 py-3 rounded-lg border border-gray-300 focus:border-indigo-900 focus:ring-2 focus:ring-indigo-900 focus:outline-none @error('first_name') border-red-500 @enderror">
                    @error('first_name')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="last_name" class="block text-sm font-semibold text-gray-900 mb-2">Nama Belakang</label>
                    <input id="last_name" 
                           type="text" 
                           name="last_name" 
                           value="{{ old('last_name') }}"
                           required 
                           class="mt-1 block w-full px-4 py-3 rounded-lg border border-gray-300 focus:border-indigo-900 focus:ring-2 focus:ring-indigo-900 focus:outline-none @error('last_name') border-red-500 @enderror">
                    @error('last_name')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="email" class="block text-sm font-semibold text-gray-900 mb-2">Alamat Email</label>
                    <input id="email" 
                           type="email" 
                           name="email" 
                           value="{{ old('email') }}"
                           required 
                           class="mt-1 block w-full px-4 py-3 rounded-lg border border-gray-300 focus:border-indigo-900 focus:ring-2 focus:ring-indigo-900 focus:outline-none @error('email') border-red-500 @enderror">
                    @error('email')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="password" class="block text-sm font-semibold text-gray-900 mb-2">Kata Sandi</label>
                    <input id="password" 
                           type="password" 
                           name="password" 
                           required 
                           class="mt-1 block w-full px-4 py-3 rounded-lg border border-gray-300 focus:border-indigo-900 focus:ring-2 focus:ring-indigo-900 focus:outline-none @error('password') border-red-500 @enderror">
                    @error('password')
                        <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label for="password_confirmation" class="block text-sm font-semibold text-gray-900 mb-2">Konfirmasi Kata Sandi</label>
                    <input id="password_confirmation" 
                           type="password" 
                           name="password_confirmation" 
                           required
                           class="mt-1 block w-full px-4 py-3 rounded-lg border border-gray-300 focus:border-indigo-900 focus:ring-2 focus:ring-indigo-900 focus:outline-none">
                </div>

                <div class="pt-2">
                    <button type="submit" 
                            class="w-full py-3 px-6 bg-indigo-950 hover:bg-indigo-900 text-white rounded-full font-semibold shadow-lg transition duration-200">
                        Daftar
                    </button>
                </div>
            </form>

            {{-- Link ke login --}}
            <div class="mt-6 text-center">
                <div class="border-t border-gray-300 my-4"></div>
                <p class="text-gray-900 text-sm">
                    Sudah punya akun? 
                    <a href="{{ route('login') }}" class="font-bold text-gray-900 hover:text-indigo-900">Masuk</a>
                </p>
            </div>
        </div>
    </div>
</div>
@endsection