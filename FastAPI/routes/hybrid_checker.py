# ada pesan eror dan hasil koreksi

# from fastapi import APIRouter
# from pydantic import BaseModel
# from app.rule_checker import check_rules
# from app.kbbi_checker import check_kbbi
# from app.text_corrector import apply_corrections

# router = APIRouter()

# class TextRequest(BaseModel):
#     text: str

# @router.post("/api/check-hybrid")
# def check_hybrid(req: TextRequest):
#     text = req.text
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
# from pydantic import BaseModel
# from app.rule_checker import check_rules
# from app.kbbi_checker import check_kbbi
# from app.text_corrector import apply_corrections

# router = APIRouter()

# class TextRequest(BaseModel):
#     text: str

# @router.post("/api/correct-text")
# def correct_text(req: TextRequest):
#     text = req.text
#     errors = check_rules(text) + check_kbbi(text)
#     corrected_text = apply_corrections(text, errors)
#     return {"original_text": text,
#             "corrected_text": corrected_text,
#             # "debug_rules": errors // bisa di-uncomment untuk debugging
#             }

# versi 2 (dengan kalimat messege "teks sudah benar")
from fastapi import APIRouter
from pydantic import BaseModel
from app.rule_checker import check_rules
from app.kbbi_checker import check_kbbi
from app.text_corrector import apply_corrections

router = APIRouter()

class TextRequest(BaseModel):
    text: str

@router.post("/api/correct-text")
def correct_text(req: TextRequest):
    text = req.text
    errors = check_rules(text) + check_kbbi(text)

    # Kalau tidak ada kesalahan, kirim pesan bahwa teks sudah benar
    if not errors:
        return {
            "original_text": text,
            "message": "Teks sudah benar, tidak ada koreksi yang diperlukan."
        }

    # Kalau ada kesalahan, lanjut koreksi otomatis
    corrected_text = apply_corrections(text, errors)
    return {
        "original_text": text,
        "corrected_text": corrected_text,
        # "debug_rules": errors // bisa di-uncomment untuk debugging
    }



