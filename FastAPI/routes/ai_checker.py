import os
from fastapi import APIRouter, UploadFile, File, HTTPException
from pydantic import BaseModel
from app.ai_service import ai_predict # Import fungsi AI Anda
import fitz  # PyMuPDF

def extract_text_from_pdf(content: bytes) -> str:
    try:
        doc = fitz.open(stream=content, filetype="pdf")
        full_text = "".join([page.get_text() for page in doc])
        return full_text
    except Exception as e:
        return ""

router = APIRouter(prefix="/api/ai", tags=["AI"])

@router.post("/check")
async def check_document_and_text(file: UploadFile = File(...)):
    content = await file.read()
    text = extract_text_from_pdf(content)

    if not text.strip():
        raise HTTPException(status_code=400, detail="Dokumen tidak mengandung teks yang dapat diekstrak.")

    ai_results = ai_predict(text)

    if ai_results and ai_results[0].get('suggestion'):
        corrected_text = ai_results[0]['suggestion']
    else:
        # Fallback jika AI tidak mengembalikan saran
        corrected_text = "Tidak dapat menghasilkan saran koreksi dari AI."

    return {
        "original_text": text,
        "corrected_text": corrected_text,
    }