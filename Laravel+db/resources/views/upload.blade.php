@extends('layouts.app')

@section('content')
<div class="min-h-screen flex items-center justify-center bg-gray-50 p-6">
    <div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-lg">
        <h2 class="text-2xl font-bold mb-6">Unggah Dokumen</h2>
        @if(session('success'))
            <div class="bg-green-100 text-green-700 p-3 rounded mb-4">{{ session('success') }}</div>
        @endif
        <form action="{{ route('upload.post') }}" method="POST" enctype="multipart/form-data" class="space-y-4">
            @csrf
            <div>
                <label class="block text-gray-700 font-medium">File</label>
                <input type="file" name="file" required class="mt-1 block w-full text-gray-700">
            </div>
            <button type="submit"
                class="w-full bg-indigo-600 text-white py-2 px-4 rounded-lg hover:bg-indigo-700 transition">Unggah</button>
        </form>
    </div>
</div>
@endsection
