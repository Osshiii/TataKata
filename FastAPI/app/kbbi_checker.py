from app.kbbi import fetch_kbbi_words

def check_kbbi(text: str):
    """
    Memeriksa kata-kata dalam teks apakah ada yang tidak terdapat di KBBI.
    Mengembalikan daftar kesalahan dalam format JSON-friendly.
    """
    kbbi_set = fetch_kbbi_words()
    errors = []

    # Pisahkan teks menjadi token kata bersih
    tokens = [w.strip(".,!?\"'").lower() for w in text.split()]

    # Cek setiap kata terhadap data KBBI
    for word in tokens:
        if word and word not in kbbi_set:
            errors.append({
                "message": f"Kata '{word}' tidak ditemukan di KBBI.",
                "rule_id": "kbbi-error"
            })

    return errors

