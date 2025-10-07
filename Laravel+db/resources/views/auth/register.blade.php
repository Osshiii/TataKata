@extends('layouts.app')

@section('content')
<div class="min-h-screen flex items-center justify-center bg-gradient-to-r from-indigo-200 via-indigo-100 to-indigo-200">
    <div class="w-full max-w-4xl bg-white rounded-3xl shadow-xl overflow-hidden grid grid-cols-1 md:grid-cols-2">

        {{-- Bagian Kiri --}}
        <div class="flex flex-col justify-center items-center p-10 bg-gradient-to-b from-gray-50 to-white relative">
            <h1 class="text-4xl font-extrabold text-indigo-800 mb-4">Tata Kata.</h1>
            <p class="text-gray-600 text-lg">Cara tercepat untuk memeriksa dokumen anda</p>
            <div class="absolute bottom-6 left-6 text-gray-300 text-sm">
                {{-- Ornamen garis --}}
                <svg class="w-24 h-24 opacity-30" viewBox="0 0 200 200" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M0,100 C50,50 150,150 200,100" stroke="currentColor" stroke-width="4" fill="none"/>
                </svg>
            </div>
        </div>

        {{-- Bagian Kanan --}}
        <div class="p-10 flex flex-col justify-center">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">Buat Akun</h2>
            
            {{-- Form Register --}}
            <form method="POST" action="{{ route('register') }}" class="space-y-5">
                @csrf
                <div>
                    <label for="first_name" class="block text-sm font-medium text-gray-700">Nama Depan</label>
                    <input id="first_name" type="text" name="first_name" required autofocus 
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring focus:ring-indigo-300">
                </div>

                <div>
                    <label for="last_name" class="block text-sm font-medium text-gray-700">Nama Belakang</label>
                    <input id="last_name" type="text" name="last_name" required 
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring focus:ring-indigo-300">
                </div>

                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">Alamat Email</label>
                    <input id="email" type="email" name="email" required 
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring focus:ring-indigo-300">
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Kata Sandi</label>
                    <input id="password" type="password" name="password" required 
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring focus:ring-indigo-300">
                </div>

                <div>
                    <label for="password_confirmation" class="block text-sm font-medium text-gray-700">Konfirmasi Kata Sandi</label>
                    <input id="password_confirmation" type="password" name="password_confirmation" required
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring focus:ring-indigo-300">
                </div>


                <div>
                    <button type="submit" 
                            class="w-full py-2 px-4 bg-indigo-700 hover:bg-indigo-800 text-white rounded-full font-semibold shadow-md transition">
                        Daftar
                    </button>
                </div>
            </form>

            {{-- Link ke login --}}
            <div class="mt-6 text-center">
                <div class="border-t my-3"></div>
                <p class="text-gray-700 text-sm">
                    Sudah punya akun? 
                    <a href="{{ route('login') }}" class="font-bold text-indigo-700 hover:underline">Masuk</a>
                </p>
            </div>
        </div>
    </div>
</div>
@endsection
