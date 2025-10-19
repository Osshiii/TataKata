import os
import mysql.connector
from dotenv import load_dotenv

# Load .env
load_dotenv()

def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USERNAME", "tatakata_user"),
        password=os.getenv("DB_PASSWORD", "userpassword"),
        database=os.getenv("DB_DATABASE", "tatakata"),
        port=int(os.getenv("DB_PORT", 3306))
    )
