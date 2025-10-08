# app/kbbi_checker.py
from app.db.connection import get_db_connection

def is_kbbi_word(word: str):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT 1 FROM kbbi_words WHERE word = %s", (word.lower(),))
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return bool(result)

def check_kbbi(text: str):
    errors = []
    for word in text.split():
        if not is_kbbi_word(word):
            errors.append({
                "message": f"Kata '{word}' tidak ditemukan di KBBI.",
                "rule_id": "kbbi"
            })
    return errors
