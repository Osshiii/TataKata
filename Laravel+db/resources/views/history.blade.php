@extends('layouts.app')

@section('content')
<div class="min-h-screen bg-gray-50 p-6">
    <div class="max-w-4xl mx-auto">
        <h2 class="text-2xl font-bold mb-6">Riwayat Dokumen</h2>
        <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
            <thead class="bg-indigo-600 text-white">
                <tr>
                    <th class="px-6 py-3 text-left">Nama File</th>
                    <th class="px-6 py-3 text-left">Lokasi File</th>
                    <th class="px-6 py-3 text-left">Status</th>
                    <th class="px-6 py-3 text-left">Waktu Upload</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                @foreach($documents as $doc)
                <tr>
                    <td class="px-6 py-4">{{ $doc->file_name }}</td>
                    <td class="px-6 py-4">
                        <a href="{{ asset('storage/'.$doc->file_location) }}" target="_blank" class="text-indigo-600 hover:underline">
                            Download
                        </a>
                    </td>
                    <td class="px-6 py-4">{{ $doc->upload_status }}</td>
                    <td class="px-6 py-4">{{ $doc->created_at->format('d M Y H:i') }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
