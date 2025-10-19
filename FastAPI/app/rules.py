# nanti
# from app.db.connection import get_db_connection

# def fetch_rule_entries(rule_id: str, category: str):
#     conn = get_db_connection()
#     cursor = conn.cursor()
#     cursor.execute("""
#         SELECT value FROM rule_entries
#         WHERE rule_id = %s AND category = %s
#     """, (rule_id, category))
#     result = cursor.fetchall()
#     cursor.close()
#     conn.close()

#     # Split by comma if multiple values in one row
#     values = []
#     for row in result:
#         values += [v.strip().lower() for v in row[0].split(",")]

#     return values


import re
# //
# tidak ada di puebi_entries
def check_tanda_baca_akhir(text):
    """Pastikan kalimat diakhiri tanda baca (., !, ?)"""
    errors = []
    cleaned = text.strip().rstrip('"').rstrip('”').rstrip("'")

    if not cleaned.endswith(('.', '!', '?')):
        errors.append({
            "message": "Kalimat harus diakhiri tanda baca (., !, ?).",
            "rule_id": "tanda-baca-akhir",
            "original": cleaned,
            "suggestion": cleaned + "."
        })
    return errors

# //
# tidak ada di puebi_entries
def check_tanda_baca_berulang(text):
    """Hindari penggunaan tanda baca berulang seperti '!!' atau '...!'"""
    errors = []
    for match in re.finditer(r'([.!?]){2,}', text):
        errors.append({
            "message": "Hindari penggunaan tanda baca berulang.",
            "rule_id": "tanda-baca-berulang",
            "original": match.group(0),
            "suggestion": match.group(0)[0]  # ambil satu tanda baca saja
        })
    return errors

# //
# tidak ada di puebi_entries
def check_spasi_setelah_koma(text):
    errors = []
    pattern = r',([^\s])'
    for match in re.finditer(pattern, text):
        errors.append({
            "message": "Gunakan spasi setelah koma.",
            "rule_id": "spasi-setelah-koma",
            "original": match.group(0),  
            "suggestion": f", {match.group(1)}"  
        })
    return errors


# //
# tidak ada di puebi_entries
def check_kata_penghubung_di_awal(text):
    """Kalimat tidak boleh dimulai dengan 'dan'."""
    errors = []
    match = re.match(r'^\s*(dan)\b', text.lower())
    if match:
        original = match.group(1)
        # hapus 'dan' atau bisa diganti dengan huruf kapital kalimat setelahnya
        sisa = re.sub(r'^\s*dan\s*', '', text, flags=re.IGNORECASE)
        corrected = sisa[0].upper() + sisa[1:] if sisa else text
        errors.append({
            "message": "Kalimat tidak boleh dimulai dengan kata 'dan'.",
            "rule_id": "kata-penghubung-di-awal",
            "original": original,
            "suggestion": corrected.strip()
        })
    return errors

# tidak ada di puebi_entries
# def check_di_imbuhan(text):
#     errors = []
#     for kerja in kata_kerja:
#         if re.search(rf'\bdi {kerja}\b', text):
#             errors.append({
#                 "message": f"Gabungkan imbuhan 'di-' dengan kata kerja → seharusnya 'di{kerja}'.",
#                 "rule_id": "imbuhan-di"
#             })
#     return errors


# ///////////////////////////////////////////////////////////////////////////////////////////////////////////
# 10 F. Huruf Kapital
nama_orang = ["sultan", "amir", "hamzah", "dewi", "sartika", "rudolf", "supratman", "volta", "ampère"]
julukan = ["jenderal", "dewa", "sultan", "dokter", "prof", "nabi"]
hari_bulan = [
    # nama hari
    "senin", "selasa", "rabu", "kamis", "jumat", "sabtu", "minggu",
    # nama bulan
    "januari", "februari", "maret", "april", "mei", "juni", "juli",
    "agustus", "september", "oktober", "november", "desember"
]

def check_huruf_kapital(text):
    """Cek penggunaan huruf kapital sesuai kaidah PUEBI"""
    errors = []

    # I.F.1: Awal kalimat
    if text and not re.match(r'^[A-Z]', text.strip()):
        errors.append({
            "message": "Kalimat harus dimulai dengan huruf kapital.",
            "rule_id": "huruf-kapital",
            "original": text.strip()[0],
            "suggestion": text.strip()[0].upper()
        })

    # I.F.3: Awal kutipan langsung
    quotes = re.findall(r'["“”](.*?)["“”]', text)
    for q in quotes:
        if q and not re.match(r'^[A-Z]', q.strip()):
            corrected = q.strip().capitalize()
            errors.append({
                "message": "Awal kutipan langsung harus huruf kapital.",
                "rule_id": "huruf-kapital",
                "original": q.strip(),
                "suggestion": corrected
            })

    # I.F.2: Nama orang dan julukan
    for kata in text.split():
        if kata.lower() in nama_orang + julukan and not kata[0].isupper():
            errors.append({
                "message": f"Nama '{kata}' seharusnya diawali huruf kapital.",
                "rule_id": "huruf-kapital",
                "original": kata,
                "suggestion": kata.capitalize()
            })

    # I.F.4: Nama Tuhan dan agama
    for match in re.finditer(r'\b(allah|tuhan|islam|kristen|hindu|weda|alquran|alkitab)\b', text, flags=re.IGNORECASE):
        original = match.group(1)
        suggestion = original.capitalize()
        if original != suggestion:
            errors.append({
                "message": f"Nama suci '{original}' harus diawali huruf kapital.",
                "rule_id": "huruf-kapital",
                "original": original,
                "suggestion": suggestion
            })

    # I.F.5: Nama hari dan bulan
    for kata in text.split():
        if kata.lower() in hari_bulan and not kata[0].isupper():
            errors.append({
                "message": f"Nama '{kata}' (hari/bulan) seharusnya diawali huruf kapital.",
                "rule_id": "huruf-kapital",
                "original": kata,
                "suggestion": kata.capitalize()
            })


    return errors

# belum tau
# 12 J. Kata Ganti
# /////////////////////////////////////////////////////////////////////////////////////////////////////////
# 6️⃣ Kata Ganti
def check_kata_ganti(text):
    errors = []

    # Awalan 'ku-' dan 'kau-'
    for match in re.finditer(r'\b(ku|kau)\s+(\w+)', text.lower()):
        prefix, word = match.groups()
        errors.append({
            "message": f"Awalan '{prefix}-' harus dirangkai dengan kata setelahnya.",
            "rule_id": "kata-ganti",
            "original": match.group(0),
            "suggestion": f"{prefix}{word}"
        })

    # Akhiran '-ku', '-mu', '-nya'
    for match in re.finditer(r'\b(\w+)\s+(ku|mu|nya)\b', text.lower()):
        word, suffix = match.groups()
        errors.append({
            "message": f"Akhiran '-{suffix}' harus dirangkai dengan kata sebelumnya.",
            "rule_id": "kata-ganti",
            "original": match.group(0),
            "suggestion": f"{word}{suffix}"
        })

    return errors


# //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# 13 F. Kata Depan // untuk Tempat dan Arah
def check_kata_depan(text):
    errors = []
    kata_tempat_dan_arah = [
        "rumah", "sekolah", "pasar", "kantor", "jalan", "kamar", "dapur", "kelas",
        "masjid", "gereja", "dalam", "luar", "atas", "bawah", "sana", "sini", "mana", "situ", "pulau", "lemari"
    ]
    kata_depan = ["di", "ke", "dari"]

    for depan in kata_depan:
        for target in kata_tempat_dan_arah:
            pattern = rf'\b{depan}{target}\b'
            for match in re.finditer(pattern, text.lower()):
                errors.append({
                    "message": f"Kata depan '{depan}' harus ditulis terpisah → '{depan} {target}'.",
                    "rule_id": "kata-depan",
                    "original": match.group(0),
                    "suggestion": f"{depan} {target}"
                })

    return errors


# /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# 14 H. Singkatan dan Akronim
def check_singkatan(text):
    errors = []
    pattern = r'\b(uud|who|un|ktp|sim|npwp|bnpb|dpr|tni|polri)\b'
    for match in re.finditer(pattern, text.lower()):
        errors.append({
            "message": f"Singkatan '{match.group(1)}' sebaiknya ditulis kapital → '{match.group(1).upper()}'.",
            "rule_id": "singkatan-akronim",
            "original": match.group(1),
            "suggestion": match.group(1).upper()
        })
    return errors

# belum tau
# 15 C. Bentuk Ulang
def check_bentuk_ulang(text):
    errors = []
    pattern = r'\b(\w+)\s+\1\b'
    for match in re.finditer(pattern, text.lower()):
        m = match.group(1)
        errors.append({
            "message": f"Bentuk ulang '{m} {m}' sebaiknya ditulis dengan tanda hubung → '{m}-{m}'.",
            "rule_id": "bentuk-ulang",
            "original": f"{m} {m}",
            "suggestion": f"{m}-{m}"
        })
    return errors

# ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# 17 B. Kata Berimbuhan
def check_kata_berimbuhan(text):
    errors = []
    kata_kerja = ['makan', 'minum', 'baca', 'tulis', 'ambil', 'lihat', 'dengar', 'pakai', 'buat', 'kerjakan']
    imbuhan_awalan = ['me', 'ber', 'ter', 'se', 'pe', 'peng', 'pen', 'mem', 'men', 'meny', 'pem', 'peny', 'di']

    matches = re.findall(r'\b(' + '|'.join(imbuhan_awalan) + r')\s+(\w+)', text.lower())

    for imbuhan, kata in matches:
        if imbuhan == "di" and kata not in kata_kerja:
            continue  # jangan koreksi kalau bukan kata kerja
        errors.append({
            "message": f"Imbuhan '{imbuhan}' harus dirangkai dengan kata → '{imbuhan}{kata}'.",
            "rule_id": "kata-berimbuhan",
            "original": f"{imbuhan} {kata}",
            "suggestion": f"{imbuhan}{kata}"
        })

    return errors


# belum tau
# 18 K. Kata Sandang
def check_kata_sandang(text):
    errors = []
    # Validasi penggunaan 'si' dan 'sang' harus diikuti nama/julukan
    matches = re.findall(r'\b(si|sang)\s+(\w+)', text.lower())
    for prefix, word in matches:
        if word in ['itu', 'ini', 'yang']:  # contoh penggunaan tidak tepat
            errors.append({
                "message": f"Kata sandang '{prefix}' tidak tepat digunakan dengan '{word}'. Gunakan hanya untuk nama atau julukan.",
                "rule_id": "kata-sandang",
                "original": f"{prefix} {word}",
                "suggestion": prefix  # hilangkan kata yang tidak tepat
            })
    return errors


# //////////////////////////////////////////////////////////////////////////////////////////////////////////
# 21 D. Gabungan Kata
# Kata majemuk yang harus ditulis terpisah (II.D.1)
kata_majemuk = [
    "duta besar", "model linear", "kambing hitam", "persegi panjang", "orang tua",
    "rumah sakit jiwa", "simpang empat", "meja tulis", "mata acara", "cendera mata"
]

kata_padu = [
    "acapkali", "adakalanya", "apalagi", "bagaimana", "barangkali", "beasiswa", "belasungkawa",
    "bilamana", "bumiputra", "darmabakti", "dukacita", "hulubalang", "kacamata", "kasatmata",
    "kilometer", "manasuka", "matahari", "olahraga", "padahal", "peribahasa", "perilaku",
    "puspawarna", "radioaktif", "saptamarga", "saputangan", "saripati", "sediakala",
    "segitiga", "sukacita", "sukarela", "syahbandar", "wiraswasta"
]

def check_gabungan_kata(text):
    errors = []
    lower_text = text.lower()

    # II.D.1 — Cek kata majemuk yang seharusnya ditulis terpisah
    for pair in kata_majemuk:
        gabung = pair.replace(" ", "")
        if gabung in lower_text:
            errors.append({
                "message": f"Kata '{gabung}' sebaiknya ditulis terpisah → '{pair}'.",
                "rule_id": "gabungan-kata",
                "original": gabung,
                "suggestion": pair
            })

    # II.D.2 — Cek gabungan kata ambigu yang seharusnya diberi tanda hubung
    for match in re.finditer(r'\b(anakistri|ibubapak|bukusejarah)\b', lower_text):
        gabung = match.group(1)
        suggestion = {
            "anakistri": "anak-istri",
            "ibubapak": "ibu-bapak",
            "bukusejarah": "buku-sejarah"
        }.get(gabung, gabung)
        errors.append({
            "message": f"Gabungan kata '{gabung}' sebaiknya diberi tanda hubung → '{suggestion}'.",
            "rule_id": "gabungan-kata",
            "original": gabung,
            "suggestion": suggestion
        })

    # II.D.5 — Validasi kata padu yang sah (tanpa koreksi)
    for word in kata_padu:
        if word in lower_text:
            # tidak menambahkan suggestion karena ini hanya validasi
            errors.append({
                "message": f"Kata '{word}' sudah sah ditulis serangkai sebagai kata padu.",
                "rule_id": "gabungan-kata",
                "original": word,
                "suggestion": word
            })

    return errors


# belum tau
# 22 I. Angka dan Bilangan
def check_angka(text):
    errors = []
    # Deteksi penulisan angka yang tidak sesuai kaidah
    for match in re.finditer(r'\b(satu|dua|tiga|empat|lima|enam|tujuh|delapan|sembilan|sepuluh)\s+(\d+)\b', text.lower()):
        original = match.group(0)
        kata, angka = match.groups()
        errors.append({
            "message": "Penulisan angka sebaiknya konsisten: gunakan angka atau kata, bukan keduanya.",
            "rule_id": "angka-bilangan",
            "original": original,
            "suggestion": angka  # disarankan pakai angka aja
        })
    return errors

# belum tau
# 23 G. Partikel
def check_partikel(text):
    errors = []
    # Deteksi partikel yang dipisah atau salah tulis (contoh: "makan lah" → "makanlah")
    matches = re.findall(r'\b(\w+)\s+(lah|kah|pun|tah)\b', text.lower())
    for kata, partikel in matches:
        original = f"{kata} {partikel}"
        suggestion = f"{kata}{partikel}"
        errors.append({
            "message": f"Partikel '-{partikel}' harus dirangkai dengan kata sebelumnya → '{suggestion}'.",
            "rule_id": "partikel",
            "original": original,
            "suggestion": suggestion
        })
    return errors

# //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# 24 J. Tanda Petik
def check_tanda_petik(text):
    errors = []

    # 🔹 III.J.1: Kutipan langsung (contoh: Dia berkata “aku pergi.”)
    if re.search(r'\b(kata|berkata|ujar|menjawab|menyatakan|seru|perintah|menurut)\b', text.lower()):
        if not re.search(r'["“”]', text):
            errors.append({
                "message": "Gunakan tanda petik untuk mengapit kutipan langsung.",
                "rule_id": "tanda-petik",
                "original": None,
                "suggestion": None
            })

    # 🔹 III.J.2: Judul karya (contoh: Saya suka lagu “Hati-Hati di Jalan”.)
    if re.search(r'\b(sajak|lagu|film|sinetron|artikel|naskah|bab buku)\b', text.lower()):
        if not re.search(r'\"[^\"]+\"', text):
            errors.append({
                "message": "Judul karya dalam kalimat sebaiknya diapit tanda petik.",
                "rule_id": "tanda-petik",
                "original": None,
                "suggestion": None
            })

    # 🔹 III.J.3: Istilah ilmiah atau kata khusus
    if re.search(r'\b(tetikus|amplop|[a-z]{3,}is)\b', text.lower()):
        if not re.search(r'\"[^\"]+\"', text):
            errors.append({
                "message": "Istilah ilmiah atau kata khusus sebaiknya diapit tanda petik.",
                "rule_id": "tanda-petik",
                "original": None,
                "suggestion": None
            })

    return errors

# belum tau
# 25 D. Tanda Titik Dua
def check_titik_dua(text):
    errors = []

    # 🔹 III.D.1, D.3, D.4 — Titik dua harus diikuti spasi (kecuali format pustaka)
    for match in re.finditer(r':(?!\s)', text):
        original = match.group(0)
        suggestion = ": "
        errors.append({
            "message": "Gunakan spasi setelah tanda titik dua.",
            "rule_id": "tanda-titik-dua",
            "original": original,
            "suggestion": suggestion
        })

    # 🔹 III.D.2 — Titik dua tidak boleh dipakai jika perincian adalah pelengkap akhir
    if re.search(r'\b(memerlukan|meliputi|terdiri atas|berisi)\b.*:', text.lower()):
        errors.append({
            "message": "Tanda titik dua tidak diperlukan jika perincian adalah pelengkap akhir kalimat.",
            "rule_id": "tanda-titik-dua",
            "original": ":",
            "suggestion": ""  # hapus titik dua
        })

    return errors










