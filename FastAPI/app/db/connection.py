import os
import mysql.connector
from dotenv import load_dotenv

# Load .env
load_dotenv()

def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "127.0.0.1"),
        user=os.getenv("DB_USERNAME", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_DATABASE", "tatakata"),
        port=int(os.getenv("DB_PORT", 3306))
    )