#!/bin/bash
set -e

cd laravel_db

composer install
npm install
npm run build

cp -n .env.example .env || true
php artisan key:generate
php artisan storage:link
php artisan migrate --force

php artisan serve --host=0.0.0.0 --port=${PORT}
