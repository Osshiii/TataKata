from fastapi import FastAPI, UploadFile, File
from app.checker import check_rules
from app.ai_dummy import ai_check

app = FastAPI(
    title="TataKata Backend",
    description="API untuk pengecekan tata bahasa dan upload PDF",
    version="0.1.0"
)

@app.get("/")
def read_root():
    return {"message": "TataKata API is running 🚀"}

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
