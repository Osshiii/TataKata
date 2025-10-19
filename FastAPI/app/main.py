# app/main.py
from fastapi import FastAPI, UploadFile, File, Query
from pydantic import BaseModel

from app.ai_service import ai_predict
from app.rule_checker import check_rules
from app.kbbi_checker import check_kbbi
from app.puebi import get_puebi_reference
from app.logger import log_corrections
from app.text_corrector import apply_corrections

# Router
from routes.hybrid_checker import router as hybrid_router
from routes.pdf_checker import router as pdf_router

app = FastAPI(
    title="TataKata Backend",
    description="API untuk pengecekan tata bahasa dan upload PDF",
    version="0.1.0"
)

# Model request body
class TextRequest(BaseModel):
    text: str

class PredictRequest(BaseModel):
    text: str

class GrammarRequest(BaseModel):
    text: str

class GrammarResponse(BaseModel):
    original_text: str
    ai_suggestion: list
    corrected_text: str = None
    manual_review: list = None

@app.get("/")
def read_root():
    return {"message": "TataKata API is running 🚀"}

# Endpoint untuk Gemini AI grammar correction
@app.post("/api/grammar-check", response_model=GrammarResponse)
def grammar_check(req: GrammarRequest):
    """
    Endpoint untuk memperbaiki grammar Bahasa Indonesia
    menggunakan AI Gemini + rule checker + KBBI.
    """
    text = req.text

    # 1. AI prediction
    ai_suggestions = ai_predict(text)
    # 2. Rule checking
    rule_errors = check_rules(text)
    # 3. KBBI checking
    kbbi_errors = check_kbbi(text)
    # 4. Gabungkan semua error
    all_errors = rule_errors + kbbi_errors
    # 5. Attach PUEBI references
    for err in all_errors:
        ref = get_puebi_reference(err["rule_id"])
        if ref:
            err["reference"] = ref
    # 6. Apply automatic corrections
    corrected_text, manual_review = apply_corrections(text, all_errors, debug=True)
    # 7. Log koreksi ke database
    log_corrections(text, all_errors)

    return {
        "original_text": text,
        "ai_suggestion": ai_suggestions,
        "corrected_text": corrected_text,
        "manual_review": manual_review
    }

# Router tambahan
app.include_router(hybrid_router)
app.include_router(pdf_router)

# Referensi PUEBI
@app.get("/api/puebi/{slug}")
def get_reference(slug: str):
    ref = get_puebi_reference(slug)
    if ref:
        return ref
    return {"error": "Referensi tidak ditemukan"}