#!/usr/bin/env bash
set -e

# Masuk ke folder Laravel kamu
cd laravel_db

echo "📦 Install dependencies..."
composer install --optimize-autoloader --no-dev --no-interaction
npm install
npm run build

echo "🗃️ Setup database dan environment..."
mkdir -p database
touch database/database.sqlite

# Pastikan file .env ada
if [ ! -f .env ]; then
  cp .env.example .env
fi

# Generate APP_KEY kalau belum ada
php artisan key:generate --force || true

# Jalankan migrasi database
php artisan migrate --force || true

# Buat symbolic link storage
php artisan storage:link || true

# Bersihkan cache & config
php artisan config:clear || true
php artisan cache:clear || true

# Jalankan Laravel di port Railway
echo "🚀 Menjalankan server Laravel di port ${PORT}"
php artisan serve --host=0.0.0.0 --port=${PORT}
