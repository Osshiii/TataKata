#!/usr/bin/env bash
set -e

cd laravel_db

echo "📦 Installing dependencies..."
composer install --optimize-autoloader --no-dev --no-interaction
npm install
npm run build

echo "🗃️ Setting up database..."
mkdir -p database
touch database/database.sqlite

if [ ! -f .env ]; then
  cp .env.example .env
fi

php artisan key:generate --force || true
php artisan storage:link || true
php artisan config:clear || true
php artisan cache:clear || true

echo "🚀 Starting Laravel..."
php artisan serve --host=0.0.0.0 --port=${PORT:-8080}

