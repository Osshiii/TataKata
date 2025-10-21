#!/bin/bash
set -e

cd laravel_db

composer install

mkdir -p database
touch database/database.sqlite

php artisan cache:clear
php artisan config:clear

cp -n .env.example .env || true
php artisan key:generate
php artisan storage:link
php artisan migrate --force

php artisan serve --host=0.0.0.0 --port=${PORT}
