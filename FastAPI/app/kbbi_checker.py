# from app.kbbi import fetch_kbbi_words
# import re
# def check_kbbi(text: str):
#     """
#     Memeriksa kata-kata dalam teks apakah ada yang tidak terdapat di KBBI.
#     Mengembalikan daftar kesalahan dalam format JSON-friendly.
#     """
#     kbbi_set = fetch_kbbi_words()
#     errors = []

#     # Pisahkan teks berdasarkan kata, dengan tanda baca sebagai pemisah
#     tokens = re.findall(r'\b\w+\b', text.lower())

#     # Cek setiap kata terhadap data KBBI
#     for word in tokens:
#         if word and word not in kbbi_set:
#             errors.append({
#                 "message": f"Kata '{word}' tidak ditemukan di KBBI.",
#                 "rule_id": "kbbi-error"
#             })

#     return errors

from app.kbbi import fetch_kbbi_words
import re
import difflib  # 🔹 tambahkan ini

def check_kbbi(text: str):
    """
    Memeriksa kata-kata dalam teks apakah ada yang tidak terdapat di KBBI.
    Jika ada typo, memberikan saran kata yang paling mirip.
    """
    kbbi_set = fetch_kbbi_words()
    errors = []
    cleaned = re.sub(r'[^\w\s]', '', text.lower())  # hapus tanda baca

    tokens = [w.strip(".,!?\"'").lower() for w in cleaned.split()]

    for word in tokens:
        if word and word not in kbbi_set:
            # cari kata yang paling mirip di daftar KBBI
            suggestion = difflib.get_close_matches(word, kbbi_set, n=1, cutoff=0.8)
            if suggestion:
                errors.append({
                    "message": f"Kata '{word}' tidak ditemukan di KBBI. Mungkin maksudnya '{suggestion[0]}'.",
                    "rule_id": "kbbi-error",
                    "original": word,
                    "suggestion": suggestion[0]
                })
            else:
                errors.append({
                    "message": f"Kata '{word}' tidak ditemukan di KBBI.",
                    "rule_id": "kbbi-error",
                    "original": word
                })

    return errors
