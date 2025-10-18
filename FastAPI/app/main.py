from fastapi import FastAPI, UploadFile, File, Query
from app.checker import check_rules
from app.ai_dummy import ai_check
from app.ai_service import ai_predict, load_model
from pydantic import BaseModel
from app.puebi import get_puebi_reference
import mysql.connector 
from app.logger import log_corrections
from transformers import pipeline
from app.kbbi_checker import check_kbbi

# Load model pipeline di awal agar tidak reload setiap request
tatakata = pipeline("fill-mask", model="citylighxts/TataKata")

app = FastAPI(
    title="TataKata Backend",
    description="API untuk pengecekan tata bahasa dan upload PDF",
    version="0.1.0"
)

class TextRequest(BaseModel):
    text: str

@app.on_event("startup")
def startup_event():
    load_model()

@app.get("/")
def read_root():
    return {"message": "TataKata API is running 🚀"}

# pakai pydantic 1 (pakai text request)
# @app.post("/api/check-hybrid")
# def check_hybrid(req: TextRequest):
#     text = req.text
#     rule_errors = check_rules(text)
#     ai_suggestions = ai_check(text)
#     return {
#         "text": text,
#         "rule_based_errors": rule_errors,
#         "ai_suggestions": ai_suggestions
#     }

# pakai pydantic 2 (pakai dict + reference)
# @app.post("/api/check-hybrid")
# def check_hybrid(payload: dict):
#     text = payload.get("text", "")
#     rule_errors = check_rules(text)
#     # kbbi_errors = check_kbbi(text) 
#     enriched_errors = attach_reference(rule_errors)

#     return {
#         "text": text,
#         "rule_based_errors": enriched_errors,
#         "ai_suggestions": ["(AI dummy) Kalimat sudah cukup efektif."]
#     }

# pakai pydantic 3 (pakai text request + reference)
@app.post("/api/check-hybrid")
def check_hybrid(req: TextRequest):
    text = req.text
    rule_errors = check_rules(text)         # ✅ rule_checkers
    kbbi_errors = check_kbbi(text)          # ✅ KBBI checker
    enriched_errors = attach_reference(rule_errors)  # ✅ tambahkan referensi PUEBI

    # Gabungkan semua error
    all_errors = enriched_errors + kbbi_errors

    return {
        "text": text,
        "rule_based_errors": all_errors,
        "ai_suggestions": ["(AI dummy) Kalimat sudah cukup efektif."]
    }

# @app.post("/api/check-hybrid")
# def check_hybrid(req: TextRequest):
#     text = req.text

#     rule_errors = check_rules(text)
#     print("[DEBUG] RULE ERRORS:", rule_errors)

#     kbbi_errors = check_kbbi(text)
#     print("[DEBUG] KBBI ERRORS:", kbbi_errors)

#     enriched_errors = attach_reference(rule_errors)
#     print("[DEBUG] ENRICHED:", enriched_errors)

#     all_errors = enriched_errors + kbbi_errors  # ✅ gabung dua sumber error
#     print("[DEBUG] FINAL ALL ERRORS:", all_errors)

#     return {
#         "text": text,
#         "rule_based_errors": all_errors,
#         "ai_suggestions": ["(AI dummy) Kalimat sudah cukup efektif."]
#     }



def attach_reference(errors: list):
    for err in errors:
        if err["rule_id"] not in ["kbbi", "kbbi-valid"]:  # skip keduanya
            ref = get_puebi_reference(err["rule_id"])
            if ref:
                err["reference"] = ref
    return errors



@app.post("/api/upload-pdf")
async def upload_pdf(file: UploadFile = File(...)):
    file_location = f"temp/{file.filename}"
    with open(file_location, "wb") as f:
        f.write(await file.read())
    return {
        "filename": file.filename,
        "message": "PDF berhasil diunggah dan disimpan."
    }

# sudah ada yang /api/predict
# @app.post("/api/predict-ai")
# def predict_ai(req: TextRequest):
#     result = ai_predict(req.text)
#     return {"ai_suggestions": result}

@app.get("/api/puebi/{slug}")
def get_reference(slug: str):
    ref = get_puebi_reference(slug)
    if ref:
        return ref
    return {"error": "Referensi tidak ditemukan"}

# belum dipakai (buat search)
# @app.get("/api/puebi/search")
# def search_puebi(keyword: str = Query(..., min_length=2)):
#     try:
#         conn = mysql.connector.connect(
#             host="localhost",
#             user="root",
#             password="",  # sesuaikan
#             database="tatakata"
#         )
#         cursor = conn.cursor(dictionary=True)
#         cursor.execute("""
#             SELECT slug, title 
#             FROM puebi_entries 
#             WHERE title LIKE %s OR content_markdown LIKE %s
#         """, (f"%{keyword}%", f"%{keyword}%"))
#         results = cursor.fetchall()
#         cursor.close()
#         conn.close()

#         return results  
#     except Exception as e:
#         return {"error": f"Gagal mencari referensi: {str(e)}"}

class PredictRequest(BaseModel):
    text: str

@app.post("/api/predict")
def predict_mask(req: PredictRequest):
    try:
        result = tatakata(req.text)
        return {"predictions": result}
    except Exception as e:
        return {"error": str(e)}
