#!/bin/bash
set -e

cd laravel_db

composer install
npm install
npm run build

mkdir -p database
touch database/database.sqlite

cp -n .env.example .env || true
php artisan key:generate
php artisan migrate --force
php artisan storage:link

php -S 0.0.0.0:${PORT} -t public
