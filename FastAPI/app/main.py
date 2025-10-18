from fastapi import FastAPI, UploadFile, File, Query
from pydantic import BaseModel
import mysql.connector 
from transformers import pipeline



from app.ai_dummy import ai_check
from app.ai_service import ai_predict, load_model

from routes import pdf_checker

from app.rule_checker import check_rules
from app.kbbi_checker import check_kbbi
from app.puebi import get_puebi_reference

from app.logger import log_corrections


# Load model pipeline di awal agar tidak reload setiap request
tatakata = pipeline("fill-mask", model="citylighxts/TataKata")

app = FastAPI(
    title="TataKata Backend",
    description="API untuk pengecekan tata bahasa dan upload PDF",
    version="0.1.0"
)


class TextRequest(BaseModel):
    text: str

class PredictRequest(BaseModel):
    text: str

@app.on_event("startup")
def startup_event():
    load_model()

@app.get("/")
def read_root():
    return {"message": "TataKata API is running 🚀"}

# pakai pydantic (pakai text request + reference)
@app.post("/api/check-hybrid")
def check_hybrid(req: TextRequest):
    text = req.text
    rule_errors = check_rules(text)         # rule_checkers
    kbbi_errors = check_kbbi(text)          # KBBI checker
    # enriched_errors = attach_reference(rule_errors)  # tambahkan referensi PUEBI

    # Gabungkan semua error
    # all_errors = enriched_errors + kbbi_errors
    all_errors = rule_errors + kbbi_errors

    return {
        "text": text,
        "rule_based_errors": all_errors,
        "ai_suggestions": ["(AI dummy) Kalimat sudah cukup efektif."]
    }

app.include_router(pdf_checker.router)

@app.post("/api/predict")
def predict_mask(req: PredictRequest):
    try:
        result = tatakata(req.text)
        return {"predictions": result}
    except Exception as e:
        return {"error": str(e)}

# @app.post("/api/upload-pdf")
# async def upload_pdf(file: UploadFile = File(...)):
#     file_location = f"temp/{file.filename}"
#     with open(file_location, "wb") as f:
#         f.write(await file.read())
#     return {
#         "filename": file.filename,
#         "message": "PDF berhasil diunggah dan disimpan."
#     }

# @app.post("/analyze-pdf")
# async def analyze_pdf(file: UploadFile = File(...)):
#     doc = fitz.open(stream=await file.read(), filetype="pdf")
#     full_text = "".join([page.get_text() for page in doc])
#     errors = check_rules(full_text)
#     return {"status": "success", "errors": errors}


# referensi PUEBI
def attach_reference(errors: list):
    for err in errors:
        if err["rule_id"] not in ["kbbi", "kbbi-valid"]:  # skip keduanya, cek nanti apa perlu ini
            ref = get_puebi_reference(err["rule_id"])
            if ref:
                err["reference"] = ref
    return errors

# api untuk mendapatkan referensi PUEBI berdasarkan slug
@app.get("/api/puebi/{slug}")
def get_reference(slug: str):
    ref = get_puebi_reference(slug)
    if ref:
        return ref
    return {"error": "Referensi tidak ditemukan"}


