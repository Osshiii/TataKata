#!/bin/bash
set -e

cd laravel+db

echo "Installing PHP dependencies..."
composer install

echo "Installing Node dependencies..."
npm install
npm run build

echo "Preparing environment..."
cp -n .env.example .env || true
php artisan key:generate

# Run *after* the docker is built
# php artisan migrate:fresh --seed || php artisan migrate

# php artisan migrate:fresh --seed && php artisan serve
# npm run dev

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

# uvicorn app.main:app --host 127.0.0.1 --port 5000
# uvicorn app.main:app --reload