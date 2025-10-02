import re

# Kamus referensi
kata_tempat = ['rumah', 'sekolah', 'jalan', 'halaman', 'kantor', 'pasar', 'dalam', 'luar', 'atas', 'bawah']
kata_kerja = ['makan', 'minum', 'baca', 'tulis', 'ambil', 'lihat', 'dengar', 'pakai', 'buat', 'kerjakan']

def check_di_kata_depan(text):
    errors = []
    for tempat in kata_tempat:
        if re.search(rf'\bdi{tempat}\b', text):
            errors.append(f"Gunakan spasi setelah kata depan 'di' → seharusnya 'di {tempat}'.")
    return errors


def check_di_imbuhan(text):
    errors = []
    for kerja in kata_kerja:
        if re.search(rf'\bdi {kerja}\b', text):
            errors.append(f"Gabungkan imbuhan 'di-' dengan kata kerja → seharusnya 'di{kerja}'.")
    return errors

def check_rules(text: str):
    errors = []

    # Aturan umum
    if not re.match(r'^[A-Z]', text.strip()):
        errors.append("Kalimat harus dimulai dengan huruf kapital.")

    if not text.strip().endswith(('.', '!', '?')):
        errors.append("Kalimat harus diakhiri tanda baca (., !, ?).")

    if re.search(r'[.!?]{2,}', text):
        errors.append("Hindari penggunaan tanda baca berulang.")

    if re.search(r',[^\s]', text):
        errors.append("Gunakan spasi setelah koma.")

    if re.match(r'^\s*dan\b', text.lower()):
        errors.append("Kalimat tidak boleh dimulai dengan kata 'dan'.")

    errors += check_di_kata_depan(text)
    errors += check_di_imbuhan(text)

    return errors
