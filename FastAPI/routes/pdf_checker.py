# from fastapi import APIRouter, UploadFile, File
# from fastapi.responses import JSONResponse
# import fitz  # PyMuPDF
# from app.rule_checker import check_rules

# router = APIRouter()

# @router.post("/analyze-pdf")
# async def analyze_pdf(file: UploadFile = File(...)):
#     try:
#         doc = fitz.open(stream=await file.read(), filetype="pdf")
#         full_text = "".join([page.get_text() for page in doc])

#         errors = check_rules(full_text)

#         return JSONResponse(content={"status": "success", "errors": errors})
#     except Exception as e:
#         return JSONResponse(content={"status": "error", "message": str(e)}, status_code=500)

# ada pesan eror dan hasil koreksi

# from fastapi import APIRouter, UploadFile, File
# from app.rule_checker import check_rules
# from app.kbbi_checker import check_kbbi
# from app.text_corrector import apply_corrections
# from app.pdf_reader import extract_text_from_pdf

# router = APIRouter()

# @router.post("/api/check-pdf")
# async def check_pdf(file: UploadFile = File(...)):
#     content = await file.read()
#     text = extract_text_from_pdf(content)

#     rule_errors = check_rules(text)
#     kbbi_errors = check_kbbi(text)
#     all_errors = rule_errors + kbbi_errors

#     corrected_text = apply_corrections(text, all_errors)

#     return {
#         "original_text": text,
#         "corrected_text": corrected_text,
#         "corrections": all_errors,
#         "ai_suggestions": ["(AI dummy) Kalimat sudah cukup efektif."]
#     }

# versi 1 (tanpa ada kalimat messege "teks sudah benar")
# from fastapi import APIRouter, UploadFile, File
# from app.rule_checker import check_rules
# from app.kbbi_checker import check_kbbi
# from app.text_corrector import apply_corrections
# from app.pdf_reader import extract_text_from_pdf

# router = APIRouter()

# @router.post("/api/correct-pdf")
# async def correct_pdf(file: UploadFile = File(...)):
#     content = await file.read()
#     text = extract_text_from_pdf(content)
#     errors = check_rules(text) + check_kbbi(text)
#     corrected_text = apply_corrections(text, errors)
#     return {"original_text": text,
#             "corrected_text": corrected_text,
#             # "debug_rules": errors // bisa di-uncomment untuk debugging
#             }


# versi 2 (dengan kalimat messege "teks sudah benar")
from fastapi import APIRouter, UploadFile, File, HTTPException
from pydantic import BaseModel
from typing import Optional

# Asumsi impor modul koreksi lainnya di sini
from app.rule_checker import check_rules
from app.kbbi_checker import check_kbbi
from app.text_corrector import apply_corrections
from app.pdf_reader import extract_text_from_pdf

router = APIRouter()

# --- Model Pydantic yang Sinkron dengan Laravel ---
class TextCorrectionRequest(BaseModel):
    """Model untuk menerima input teks mentah dari Laravel Controller."""
    # Sesuai dengan payload yang dikirim dari Laravel Http::post()
    title: Optional[str] = None
    text: str # Kunci yang disepakati untuk teks mentah
# -----------------------------------------------------

@router.post("/api/correct-pdf")
async def correct_pdf(file: UploadFile = File(...)):
    # Baca isi file PDF
    content = await file.read()
    text = extract_text_from_pdf(content)

    # Jalankan pemeriksaan aturan + KBBI
    errors = check_rules(text) + check_kbbi(text)

    # Kalau tidak ada kesalahan, langsung kembalikan pesan
    if not errors:
        return {
            "original_text": text,
            "message": "Teks dalam PDF sudah benar, tidak ada koreksi yang diperlukan."
        }

    # Kalau ada kesalahan, koreksi otomatis
    corrected_text = apply_corrections(text, errors)

    return {
        "original_text": text,
        "corrected_text": corrected_text,
        # "debug_rules": errors // bisa di-uncomment untuk debugging
    }

@router.post("/api/correct-text")
async def correct_text(request_data: TextCorrectionRequest):
    """Memproses input teks mentah dari JSON body untuk koreksi."""
    
    # 1. Dapatkan teks dari body request
    text = request_data.text
    
    if not text.strip():
        raise HTTPException(status_code=400, detail="Konten teks tidak boleh kosong.")

    # 2. Jalankan pemeriksaan aturan + KBBI
    errors = check_rules(text) + check_kbbi(text)

    # 3. Kalau tidak ada kesalahan, langsung kembalikan pesan
    if not errors:
        return {
            "original_text": text,
            "message": "Teks sudah benar, tidak ada koreksi yang diperlukan."
        }

    # 4. Kalau ada kesalahan, koreksi otomatis
    corrected_text = apply_corrections(text, errors)

    # 5. Kembalikan hasil
    return {
        "title": request_data.title, 
        "original_text": text,
        "corrected_text": corrected_text,
        # "debug_rules": errors 
    }


# from fastapi import APIRouter, UploadFile, File, Query
# from app.rule_checker import check_rules
# from app.kbbi_checker import check_kbbi
# from app.text_corrector import apply_corrections
# from app.pdf_reader import extract_text_from_pdf

# router = APIRouter()

# @router.post("/api/correct-pdf")
# async def correct_pdf(
#     file: UploadFile = File(...),
#     debug: bool = Query(False, description="Aktifkan untuk melihat detail error/debug.")
# ):
#     content = await file.read()
#     text = extract_text_from_pdf(content)

#     # Gabungkan semua error
#     errors = check_rules(text) + check_kbbi(text)
#     corrected_text = apply_corrections(text, errors)

#     response = {
#         "original_text": text,
#         "corrected_text": corrected_text
#     }

#     # hanya tampilkan errors kalau debug=True
#     if debug:
#         response["debug_errors"] = errors

#     return response

# from fastapi import Query

# @router.post("/api/correct-pdf")
# async def correct_pdf(
#     file: UploadFile = File(...),
#     debug: bool = Query(False)
# ):
#     content = await file.read()
#     text = extract_text_from_pdf(content)
#     errors = check_rules(text) + check_kbbi(text)

#     corrected_text = apply_corrections(text, errors, debug=debug)

#     response = {
#         "original_text": text,
#         "corrected_text": corrected_text
#     }

#     if debug:
#         response["debug_errors"] = errors

#     return response



