from app.db.connection import get_db_connection
import re
import html

# def fetch_kbbi_words():
#     """
#     Mengambil daftar kata dari tabel KBBI, membersihkan HTML/tanda baca,
#     dan mengembalikan dalam bentuk set untuk pencarian cepat.
#     """
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

#         # Bersihkan karakter HTML, tanda baca, dan angka
#         text = html.unescape(raw_word)
#         text = re.sub(r'<[^>]+>', '', text)
#         text = re.sub(r'[·/0-9]', '', text)
#         text = re.sub(r'[^a-zA-Z\s-]', '', text)
#         text = text.strip().lower()

#         if text:
#             # Ambil kata pertama (misalnya "air (n)" jadi "air")
#             first_word = text.split()[0]
#             clean_words.add(first_word)

#     return clean_words

_kbbi_cache = None

def fetch_kbbi_words():
    global _kbbi_cache
    if _kbbi_cache is not None:
        return _kbbi_cache

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
        text = html.unescape(raw_word)
        text = re.sub(r'<[^>]+>', '', text)
        text = re.sub(r'[·/0-9]', '', text)
        text = re.sub(r'[^a-zA-Z\s-]', '', text)
        text = text.strip().lower()
        if text:
            first_word = text.split()[0]
            clean_words.add(first_word)

    _kbbi_cache = clean_words
    return _kbbi_cache
