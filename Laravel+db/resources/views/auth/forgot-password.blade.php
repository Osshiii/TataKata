@extends('layouts.app')

@section('content')
<div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-gray-600 via-gray-700 to-blue-400 p-6">
    <div class="bg-white/90 backdrop-blur-md rounded-3xl shadow-xl p-8 w-full max-w-md text-center">
        {{-- Title --}}
        <h1 class="text-2xl font-semibold text-gray-900 mb-6">Lupa Kata Sandi</h1>

        {{-- Keterangan --}}
        <p class="text-sm text-gray-600 mb-6 italic">
            *Masukkan email yang terdaftar untuk menerima link reset password
        </p>

        {{-- Session Status (Success Message) --}}
        @if (session('status'))
            <div class="mb-4 p-4 bg-green-100 border border-green-400 text-green-700 rounded-lg text-sm">
                {{ session('status') }}
            </div>
        @endif

        {{-- Form --}}
        <form method="POST" action="{{ route('password.email') }}" class="space-y-6">
            @csrf

            {{-- Email Input --}}
            <div>
                <input
                    id="email"
                    name="email"
                    type="email"
                    value="{{ old('email') }}"
                    required
                    autofocus
                    placeholder="Email Anda"
                    class="w-full px-4 py-2 border @error('email') border-red-500 @else border-gray-300 @enderror rounded-md focus:ring-2 focus:ring-blue-400 focus:outline-none"
                >
                @error('email')
                    <p class="mt-2 text-sm text-red-600 text-left">{{ $message }}</p>
                @enderror
            </div>

            {{-- Submit Button --}}
            <div>
                <button
                    type="submit"
                    class="w-full bg-[#0E0E3C] text-white font-semibold rounded-full py-2 hover:bg-[#141457] transition duration-200"
                >
                    Kirim Link Reset Password
                </button>
            </div>
        </form>

        {{-- Link Back --}}
        <div class="mt-8 text-sm text-gray-700">
            <a href="{{ route('login') }}" class="hover:underline">
                Kembali ke <span class="font-semibold">Masuk</span>
            </a>
        </div>
    </div>
</div>
@endsection