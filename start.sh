#!/bin/bash
set -e

cd laravel_db

# Install backend & frontend dependencies
composer install
npm install
npm run build

# Setup SQLite (atau bisa diganti MySQL kalau pakai plugin)
mkdir -p database
touch database/database.sqlite

# Setup Laravel
cp -n .env.example .env || true
php artisan key:generate
php artisan migrate --force
php artisan storage:link

# Serve Laravel di port Railway (gunakan PHP built-in server)
php -S 0.0.0.0:${PORT} -t public
