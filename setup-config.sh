#!/bin/bash
set -e

cd laravel+db

echo "Installing PHP dependencies..."
composer install --no-interaction --prefer-dist --optimize-autoloader

echo "Installing Node dependencies..."
npm install
npm run build

echo "Preparing environment..."
cp -n .env.example .env || true
php artisan key:generate

# Run *after* the docker is built
# echo "Running database migrations..."
# php artisan migrate:fresh --seed || php artisan migrate

echo "Laravel setup complete."