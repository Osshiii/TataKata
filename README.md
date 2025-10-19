# TataKata: Big Project Kelompok 6 PBKK C 2025

### Anggota Kelompok 6
|    NRP     |      Nama      |
| :--------: | :------------: |
| 5025231041 | Amelia Nova Safitri |
| 5025231043 | Tarisha Falah Basuki |
| 5025231045 | Putriani Pirma A S |
| 5025231059 | Dinda Ayu Ningratu P |
| 5025231134 | Hana Azizah Nurhadi |
| 5025231138 | Aqila Zahira Naia P A |
| 5025231146 | Salsabila Purnama |
| 5025231307 | Rosidah Darman |

### Deskripsi
  TataKata adalah website berbasis AI yang membantu mahasiswa dalam menyempurnakan dokumen tugas akhir mereka agar sesuai dengan kaidah bahasa Indonesia yang baik dan benar. Dengan teknologi pemrosesan bahasa alami (NLP), TataKata mampu memeriksa kata baku, kalimat efektif, tanda baca, imbuhan, serta ejaan untuk memastikan tulisan sesuai dengan kaidah bahasa Indonesia. Selain itu, TataKata juga dilengkapi dengan fitur deteksi salah ketik (typo) dan translasi ke bahasa Indonesia sehingga sangat membantu mahasiswa.
Website ini dirancang agar mudah digunakan. Mahasiswa cukup mendaftar dan login menggunakan akun email yang dimiliki. Lalu pengguna bisa memasukkan teks atau PDF, lalu sistem AI akan langsung memberikan analisis serta saran perbaikan yang detail. Tujuannya bukan hanya mengoreksi, tetapi juga mendidik pengguna agar lebih peka terhadap penggunaan bahasa Indonesia yang baik dan benar.

### How to Run
- Laravel
1. Jalankan command ```cd laravel_db``` untuk mengakses repositori ```Laravel```.
2. Jalankan instalasi ```composer install``` untuk backend dan ```npm install``` ```npm run build``` untuk frontend.
3. Jalankan command ```npm run dev``` untuk compile aset frontend ke ```Laravel```.
4. Copy konfigurasi ```.env``` dengan command ```cp -n .env.example .env```.
5. Jalankan command ```php artisan key:generate``` untuk enkripsi data.
6. Jalankan command ```php artisan migrate:fresh --seed``` untuk ekspor database ```mysql``` ke sistem backend.
7. Jalankan command ```php artisan storage:link``` untuk menyimpan dokumen.
8. Jalankan command ```php artisan serve``` untuk mengakses database ```Laravel``` di localhost browser (http://127.0.0.1:8000/).

- FastAPI
1. Jalankan command ```cd FastAPI``` untuk mengakses repositori ```FastAPI```.
2. Jalankan instalasi library python dengan command ```python3 -m pip install fastapi uvicorn python-multipart pydantic mysql-connector-python torch transformers google-genai pymupdf```. Jika Anda menggunakan virtual environment, jalankan ```python3 -m venv .venv``` dan ```source .venv/bin/activate```.
3. Jalankan command ```uvicorn app.main:app --host 127.0.0.1 --port 5000``` untuk mangakses database ```FastAPI``` di localhost browser (http://127.0.0.1:5000/docs).

Untuk efisiensi waktu, jalankan ```config-setup.sh``` dengan run command ```bash config-setup.sh``` pada terminal Linux.
