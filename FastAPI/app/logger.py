from app.db.connection import get_db_connection

def log_corrections(text, errors):
    conn = get_db_connection()
    cursor = conn.cursor()

    for err in errors:
        cursor.execute("""
            INSERT INTO correction_logs (text, rule_id, message, created_at)
            VALUES (%s, %s, %s, NOW())
        """, (text, err["rule_id"], err["message"]))

    conn.commit()
    cursor.close()
    conn.close()
