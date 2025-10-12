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
# php artisan migrate:fresh --seed || php artisan migrate

echo "Laravel setup complete."

cd ..
cd fastapi
echo "Starting installations for FastAPI..."

echo "Installing Python dependencies..."
mkdir -p wheelhouse

if [ -d "wheelhouse" ] && [ "$(ls -A wheelhouse)" ]; then
    echo "Using cached Python packages from wheelhouse..."
    python3 -m pip install --no-index --find-links=wheelhouse -r requirements.txt
else
    echo "Downloading and caching Python packages..."
    python3 -m pip download -r requirements.txt -d wheelhouse
    python3 -m pip install --no-index --find-links=wheelhouse -r requirements.txt
fi

echo "FastAPI setup complete."

cd ..