#!/bin/bash
set -e

cd laravel_db

# Set environment overrides (optional, bisa juga langsung di .env.example)
export CACHE_STORE=file
export SESSION_DRIVER=file
export QUEUE_CONNECTION=sync

# Install backend & frontend dependencies
composer install
npm install
npm run build

# Setup SQLite (untuk cache/session jika pakai database)
mkdir -p database
touch database/database.sqlite

# Setup Laravel
cp -n .env.example .env || true
php artisan key:generate
php artisan migrate --force
php artisan storage:link

# Serve Laravel di port Railway
php -S 0.0.0.0:${PORT} -t public
