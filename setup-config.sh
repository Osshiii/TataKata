#!/bin/bash
set -e

cd laravel_db

# pastiin aplikasi buat ngerun mysql udah nyala/jalan

composer install
npm install
npm run build
cp -n .env.example .env || true
php artisan key:generate
php artisan storage:link
php artisan migrate:fresh --seed

# npm run dev
# php artisan serve

cd ..
cd fastapi
python3 -m pip install fastapi uvicorn python-multipart pydantic mysql-connector-python torch transformers google-genai pymupdf

cd ..

# uvicorn app.main:app --host 127.0.0.1 --port 5000
