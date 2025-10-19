from fastapi import APIRouter
from pydantic import BaseModel
from app.ai_service import ai_predict

router = APIRouter(prefix="/api/ai", tags=["AI"])

class TextRequest(BaseModel):
    text: str

@router.post("/check")
async def check_text(request: TextRequest):
    """
    Endpoint untuk mengecek apakah kalimat efektif atau tidak
    """
    result = ai_predict(request.text)
    return {"result": result}