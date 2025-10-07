<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User seeder contoh bawaan
        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
        ]);

        // Tambahkan seeder KBBI di sini
        $this->call([
            \Database\Seeders\PuebiEntriesSeeder::class,
            \Database\Seeders\KbbiEntriesSeeder::class,
        ]);
    }
}
