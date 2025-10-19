# app/ai_service.py
import os
from typing import List, Dict
from dotenv import load_dotenv
from google import genai

# Muat file .env
load_dotenv()

# Ambil API key dari .env
api_key = os.getenv("GOOGLE_API_KEY")

if not api_key:
    raise ValueError("API key tidak ditemukan di file .env!")

# Inisialisasi Gemini client dengan API key
client = genai.Client(api_key=api_key)

def ai_predict(teks: str) -> List[Dict]:
    """
    Gunakan Gemini untuk memperbaiki grammar dan membuat kalimat lebih efektif dalam bahasa Indonesia.
    """
    prompt = f"""
    Teks berikut berbahasa Indonesia.
    Tugasmu adalah:
    1. Perbaiki kesalahan tata bahasa, ejaan, dan struktur kalimat.
    2. Buat kalimat menjadi lebih efektif dan mudah dipahami.
    3. Jangan ubah makna asli teks.

    Teks:
    \"\"\"{teks}\"\"\"

    Hasil koreksi:
    """

    try:
        response = client.models.generate_content(
            model="gemini-2.5-flash",
            contents=prompt,
        )
        suggestion = response.text.strip()
    except Exception as e:
        suggestion = ""
        print(f"[AI PREDICT ERROR]: {e}")

    return [{
        "sentence": teks,
        "suggestion": suggestion,
        "category": "kalimat_efektif",
        "confidence": None,
        "source": "gemini"
    }]