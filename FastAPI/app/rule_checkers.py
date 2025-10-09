import re

# Kamus referensi
kata_depan = ["di", "ke", "dari"]
kata_target = [
    "rumah", "sekolah", "pasar", "kantor", "jalan", "kamar", "dapur", "kelas",
    "masjid", "gereja", "dalam", "luar", "atas", "bawah", "sana", "sini", "mana", "situ", "pulau", "lemari"
]
kata_kerja = ['makan', 'minum', 'baca', 'tulis', 'ambil', 'lihat', 'dengar', 'pakai', 'buat', 'kerjakan']

import re

# 10
def check_huruf_kapital(text):
    errors = []

    # I.F.1: Awal kalimat
    if not re.match(r'^[A-Z]', text.strip()):
        errors.append({
            "message": "Kalimat harus dimulai dengan huruf kapital.",
            "rule_id": "huruf-kapital"
        })

    # I.F.3: Awal kutipan langsung
    quotes = re.findall(r'["“”](.*?)["“”]', text)
    for q in quotes:
        if q and not re.match(r'^[A-Z]', q.strip()):
            errors.append({
                "message": "Awal kutipan langsung harus huruf kapital.",
                "rule_id": "huruf-kapital"
            })

    # I.F.2: Nama orang dan julukan
    # cari cara agar tidak manual
    nama_orang = ["amir", "hamzah", "dewi", "sartika", "rudolf", "supratman", "volta", "ampère"]
    julukan = ["jenderal", "dewa", "sultan", "dokter", "prof", "nabi"]
    for kata in text.split():
        if kata.lower() in nama_orang + julukan:
            if not kata[0].isupper():
                errors.append({
                    "message": f"Nama '{kata}' seharusnya diawali huruf kapital.",
                    "rule_id": "huruf-kapital"
                })

    # I.F.4: Nama Tuhan dan agama
    if re.search(r'\b(allah|tuhan|islam|kristen|hindu|weda|alquran|alkitab)\b', text.lower()):
        for kata in text.split():
            if kata.lower() in ["allah", "tuhan", "islam", "kristen", "hindu", "weda", "alquran", "alkitab"]:
                if not kata[0].isupper():
                    errors.append({
                        "message": f"Nama suci '{kata}' harus diawali huruf kapital.",
                        "rule_id": "huruf-kapital"
                    })

    return errors

# tidak ada di puebi_entries
def check_tanda_baca_akhir(text):
    cleaned = text.strip().rstrip('"').rstrip('”').rstrip("'")
    if not cleaned.endswith(('.', '!', '?')):
        return [{
            "message": "Kalimat harus diakhiri tanda baca (., !, ?).",
            "rule_id": "tanda-baca-akhir"
        }]
    return []

# tidak ada di puebi_entries
def check_tanda_baca_berulang(text):
    if re.search(r'[.!?]{2,}', text):
        return [{
            "message": "Hindari penggunaan tanda baca berulang.",
            "rule_id": "tanda-baca-berulang"
        }]
    return []

# tidak ada di puebi_entries
def check_spasi_setelah_koma(text):
    if re.search(r',[^\s]', text):
        return [{
            "message": "Gunakan spasi setelah koma.",
            "rule_id": "spasi-setelah-koma"
        }]
    return []


# tidak ada di puebi_entries
def check_kata_penghubung_di_awal(text):
    if re.match(r'^\s*dan\b', text.lower()):
        return [{
            "message": "Kalimat tidak boleh dimulai dengan kata 'dan'.",
            "rule_id": "kata-penghubung-di-awal"
        }]
    return []

# 13
def check_kata_depan(text):
    errors = []

    for depan in kata_depan:
        for target in kata_target:
            # Deteksi penulisan tanpa spasi: dimana, kesana, dariatas, dll
            if re.search(rf'\b{depan}{target}\b', text.lower()):
                errors.append({
                    "message": f"Kata depan '{depan}' harus ditulis terpisah → seharusnya '{depan} {target}'.",
                    "rule_id": "kata-depan"
                })

    return errors

# tidak ada di puebi_entries
def check_di_imbuhan(text):
    errors = []
    for kerja in kata_kerja:
        if re.search(rf'\bdi {kerja}\b', text):
            errors.append({
                "message": f"Gabungkan imbuhan 'di-' dengan kata kerja → seharusnya 'di{kerja}'.",
                "rule_id": "imbuhan-di"
            })
    return errors

# 4
def check_diftong(text):
    errors = []
    diftongs = ["ai", "au", "ei", "oi"]
    words = re.findall(r'\b\w+\b', text.lower())

    for word in words:
        for diftong in diftongs:
            # Cek apakah diftong muncul di tengah atau akhir kata
            if re.search(rf'\w+{diftong}\w*$', word):
                errors.append({
                    "message": f"Kata '{word}' mengandung huruf diftong '{diftong}'. Pastikan penulisannya sesuai kaidah.",
                    "rule_id": "huruf-diftong"
                })
                break  # Hindari duplikat error untuk satu kata

    return errors

# 21
# Kata majemuk yang harus ditulis terpisah (II.D.1)
kata_majemuk = [
    "duta besar", "model linear", "kambing hitam", "persegi panjang", "orang tua",
    "rumah sakit jiwa", "simpang empat", "meja tulis", "mata acara", "cendera mata"
]

# Gabungan kata yang sudah padu dan sah ditulis serangkai (II.D.5)
kata_padu = [
    "acapkali", "adakalanya", "apalagi", "bagaimana", "barangkali", "beasiswa", "belasungkawa",
    "bilamana", "bumiputra", "darmabakti", "dukacita", "hulubalang", "kacamata", "kasatmata",
    "kilometer", "manasuka", "matahari", "olahraga", "padahal", "peribahasa", "perilaku",
    "puspawarna", "radioaktif", "saptamarga", "saputangan", "saripati", "sediakala",
    "segitiga", "sukacita", "sukarela", "syahbandar", "wiraswasta"
]

# 21
def check_gabungan_kata(text):
    errors = []
    words = re.findall(r'\b\w+\b', text.lower())

    # II.D.1 — Cek kata majemuk yang seharusnya ditulis terpisah
    for pair in kata_majemuk:
        gabung = pair.replace(" ", "")
        if gabung in text.lower():
            errors.append({
                "message": f"Kata '{gabung}' sebaiknya ditulis terpisah → '{pair}'.",
                "rule_id": "gabungan-kata"
            })

    # II.D.2 — Cek gabungan kata ambigu yang seharusnya diberi tanda hubung
    if re.search(r'\b(anakistri|ibubapak|bukusejarah)\b', text.lower()):
        errors.append({
            "message": "Gabungan kata ambigu sebaiknya diberi tanda hubung, misalnya 'anak-istri', 'ibu-bapak'.",
            "rule_id": "gabungan-kata"
        })

    # II.D.5 — Validasi kata padu yang sah ditulis serangkai
    for word in words:
        if word not in kata_padu and re.search(r'(acapkali|bagaimana|matahari|olahraga)', word):
            errors.append({
                "message": f"Kata '{word}' sudah sah ditulis serangkai sebagai kata padu.",
                "rule_id": "gabungan-kata",
                "note": "Tidak perlu koreksi, hanya validasi."
            })

    return errors

# 12
def check_kata_ganti(text):
    errors = []

    # 🔹 PUEBI J.1 — Awalan 'ku-' dan 'kau-' harus dirangkai
    if re.search(r'\bku\s+\w+', text.lower()):
        errors.append({
            "message": "Awalan 'ku-' harus dirangkai dengan kata yang mengikutinya, misalnya 'kujual'.",
            "rule_id": "kata-ganti",
            "rule_number": "J.1"
        })
    if re.search(r'\bkau\s+\w+', text.lower()):
        errors.append({
            "message": "Awalan 'kau-' harus dirangkai dengan kata yang mengikutinya, misalnya 'kaubaca'.",
            "rule_id": "kata-ganti",
            "rule_number": "J.1"
        })

    # 🔹 PUEBI J.1 — Akhiran '-ku', '-mu', '-nya' harus dirangkai
    if re.search(r'\b\w+\s+(ku|mu|nya)\b', text.lower()):
        errors.append({
            "message": "Akhiran '-ku', '-mu', '-nya' harus dirangkai dengan kata sebelumnya, misalnya 'bukuku'.",
            "rule_id": "kata-ganti",
            "rule_number": "J.1"
        })

    return errors

# 24
def check_tanda_petik(text):
    errors = []

    # 🔹 III.J.1: Kutipan langsung
    if re.search(r'\b(kata|berkata|ujar|menjawab|menyatakan|seru|perintah|menurut)\b', text.lower()):
        if not re.search(r'["“”]', text):
            errors.append({
                "message": "Gunakan tanda petik untuk mengapit kutipan langsung.",
                "rule_id": "tanda-petik"
            })

    # 🔹 III.J.2: Judul karya
    if re.search(r'\b(sajak|lagu|film|sinetron|artikel|naskah|bab buku)\b', text.lower()):
        if not re.search(r'\"[^\"]+\"', text):
            errors.append({
                "message": "Judul karya dalam kalimat sebaiknya diapit tanda petik.",
                "rule_id": "tanda-petik"
            })

    # 🔹 III.J.3: Istilah ilmiah atau kata khusus
    if re.search(r'\b(tetikus|amplop|[a-z]{3,}is)\b', text.lower()):
        if not re.search(r'\"[^\"]+\"', text):
            errors.append({
                "message": "Istilah ilmiah atau kata khusus sebaiknya diapit tanda petik.",
                "rule_id": "tanda-petik"
            })

    return errors

# 25
import re

def check_titik_dua(text):
    errors = []

    # 🔹 III.D.1, D.3, D.4 — Titik dua harus diikuti spasi (kecuali format pustaka)
    matches = re.finditer(r':(?!\s)', text)
    for match in matches:
        errors.append({
            "message": "Gunakan spasi setelah tanda titik dua.",
            "rule_id": "tanda-titik-dua",
        })

    # 🔹 III.D.2 — Titik dua tidak boleh dipakai jika perincian adalah pelengkap akhir
    if re.search(r'\b(memerlukan|meliputi|terdiri atas|berisi)\b.*:', text.lower()):
        errors.append({
            "message": "Tanda titik dua tidak diperlukan jika perincian adalah pelengkap akhir kalimat.",
            "rule_id": "tanda-titik-dua",
        })

    # 🔹 III.D.5 — Validasi titik dua dalam format pustaka (boleh tanpa spasi)
    # Contoh: Surah Albaqarah:2–5 atau Jakarta:Pusat Bahasa
    # Tidak perlu koreksi, bisa tambahkan validasi jika ingin

    return errors
