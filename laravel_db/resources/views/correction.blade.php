@extends('layouts.app')

@section('content')
<div style="max-width: 900px; margin: 0 auto; padding: 20px;">
    <h2>Hasil Koreksi untuk: {{ $document->file_name }}</h2>

    @if(session('success'))
        <div style="background-color: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin-top: 10px;">
            {{ session('success') }}
        </div>
    @endif

    <!-- Kotak dua kolom -->
    <div style="display: flex; gap: 20px; margin-top: 20px; flex-wrap: wrap;">
        <!-- Teks Asli -->
        <div style="flex: 1 1 45%; padding: 15px; border: 1px solid #ccc; border-radius: 5px; min-width: 300px;">
            <h5>📄 Teks Asli</h5>
            <p>
                {{ $original_text }}
            </p>
        </div>

        <!-- Hasil Koreksi -->
        <div style="flex: 1 1 45%; padding: 15px; border: 1px solid #4CAF50; border-radius: 5px; min-width: 300px; background-color: #f0fff0;">
            <h5>✅ Hasil Koreksi</h5>
            <p>
                {{ $corrected_text }}
            </p>
        </div>
    </div>

    <a href="{{ route('history') }}" style="display: inline-block; margin-top: 20px; padding: 10px 15px; background-color: #007bff; color: #fff; border-radius: 5px; text-decoration: none;">
        Kembali ke Riwayat
    </a>
</div>
@endsection
