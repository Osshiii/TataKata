# # app/kbbi_checker.py
# from app.db.connection import get_db_connection
# import re
# import html

# def fetch_kbbi_words():
#     conn = get_db_connection()
#     cursor = conn.cursor()
#     cursor.execute("SELECT word FROM kbbi_entries")
#     result = cursor.fetchall()
#     cursor.close()
#     conn.close()

#     clean_words = set()

#     for row in result:
#         raw_word = row[0]
#         if not raw_word:
#             continue

#         text = html.unescape(raw_word)
#         text = re.sub(r'<[^>]+>', '', text)
#         text = re.sub(r'[·/0-9]', '', text)
#         text = re.sub(r'[^a-zA-Z\s-]', '', text)
#         text = text.strip().lower()

#         if text:
#             first_word = text.split()[0]
#             clean_words.add(first_word)

#     print(f"[DEBUG] Jumlah kata di KBBI: {len(clean_words)}")
#     return clean_words


# def check_kbbi(text: str):
#     errors = []
#     kbbi_set = fetch_kbbi_words()
#     print(f"[DEBUG] Jumlah kata KBBI: {len(kbbi_set)}")
#     print(f"[DEBUG] Contoh kata KBBI: {list(kbbi_set)[:20]}")

#     tokens = [w.strip(".,!?\"'").lower() for w in text.split()]
#     print(f"[DEBUG] Tokens input: {tokens}")

#     # 🔍 bagian pengecekan kata
#     for word in tokens:
#         if word and word not in kbbi_set:
#             errors.append({
#                 "message": f"Kata '{word}' tidak ditemukan di KBBI.",
#                 "rule_id": "kbbi-error"
#             })

#     print(f"[DEBUG] Errors ditemukan: {errors}")
#     return errors


from app.db.connection import get_db_connection
import re
import html

def fetch_kbbi_words():
    """
    Mengambil daftar kata dari tabel KBBI, membersihkan HTML/tanda baca,
    dan mengembalikan dalam bentuk set untuk pencarian cepat.
    """
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT word FROM kbbi_entries")
    result = cursor.fetchall()
    cursor.close()
    conn.close()

    clean_words = set()

    for row in result:
        raw_word = row[0]
        if not raw_word:
            continue

        # Bersihkan karakter HTML, tanda baca, dan angka
        text = html.unescape(raw_word)
        text = re.sub(r'<[^>]+>', '', text)
        text = re.sub(r'[·/0-9]', '', text)
        text = re.sub(r'[^a-zA-Z\s-]', '', text)
        text = text.strip().lower()

        if text:
            # Ambil kata pertama (misalnya "air (n)" jadi "air")
            first_word = text.split()[0]
            clean_words.add(first_word)

    return clean_words


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

