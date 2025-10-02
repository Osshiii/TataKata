from fastapi import FastAPI, UploadFile, File
from app.checker import check_rules
from app.ai_dummy import ai_check
from app.ai_service import ai_predict, load_model
from pydantic import BaseModel

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

# pakai pydantic 
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

@app.post("/api/check-hybrid")
def check_hybrid(text: str):
    rule_errors = check_rules(text)
    ai_suggestions = ai_check(text)
    return {
        "text": text,
        "rule_based_errors": rule_errors,
        "ai_suggestions": ai_suggestions
    }

@app.post("/api/upload-pdf")
async def upload_pdf(file: UploadFile = File(...)):
    file_location = f"temp/{file.filename}"
    with open(file_location, "wb") as f:
        f.write(await file.read())
    return {
        "filename": file.filename,
        "message": "PDF berhasil diunggah dan disimpan."
    }

@app.post("/api/predict-ai")
def predict_ai(req: TextRequest):
    result = ai_predict(req.text)
    return {"ai_suggestions": result}
