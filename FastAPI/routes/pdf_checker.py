from fastapi import APIRouter, UploadFile, File
from fastapi.responses import JSONResponse
import fitz  # PyMuPDF
from app.rule_checker import check_rules

router = APIRouter()

@router.post("/analyze-pdf")
async def analyze_pdf(file: UploadFile = File(...)):
    try:
        doc = fitz.open(stream=await file.read(), filetype="pdf")
        full_text = "".join([page.get_text() for page in doc])

        errors = check_rules(full_text)

        return JSONResponse(content={"status": "success", "errors": errors})
    except Exception as e:
        return JSONResponse(content={"status": "error", "message": str(e)}, status_code=500)