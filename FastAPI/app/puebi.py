import mysql.connector
from app.db.connection import get_db_connection

def get_puebi_reference(slug: str):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT title, content_markdown FROM puebi_entries WHERE slug = %s", (slug,))
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        return result
    except:
        return None

