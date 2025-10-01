# app/ai_service.py
import os
from typing import List, Dict
# from transformers import pipeline

MODEL = None
MODEL_TYPE = os.environ.get("MODEL_TYPE", "dummy")   # "dummy", "text2text", "text-classification"
HF_MODEL_PATH = os.environ.get("HF_MODEL_PATH", "")  # contoh: "/models/indot5-finetuned"

def load_model():
    global MODEL
    if MODEL_TYPE == "dummy" or HF_MODEL_PATH == "":
        MODEL = "dummy"
        print("AI Service running in DUMMY mode")
    else:
        try:
            from transformers import pipeline  # <- import hanya kalau butuh
        except ImportError:
            raise RuntimeError("Transformers library tidak tersedia di dummy mode")

        if MODEL_TYPE == "text2text":
            MODEL = pipeline("text2text-generation", model=HF_MODEL_PATH, tokenizer=HF_MODEL_PATH)
        elif MODEL_TYPE == "text-classification":
            MODEL = pipeline("text-classification", model=HF_MODEL_PATH, tokenizer=HF_MODEL_PATH, return_all_scores=True)
        else:
            raise ValueError("Unsupported MODEL_TYPE")
        print(f"AI model loaded from {HF_MODEL_PATH} ({MODEL_TYPE})")
        
        """
        if MODEL_TYPE == "text2text":
            MODEL = pipeline("text2text-generation", model=HF_MODEL_PATH, tokenizer=HF_MODEL_PATH)
        elif MODEL_TYPE == "text-classification":
            MODEL = pipeline("text-classification", model=HF_MODEL_PATH, tokenizer=HF_MODEL_PATH, return_all_scores=True)
        else:
            raise ValueError("Unsupported MODEL_TYPE")
        print(f"AI model loaded from {HF_MODEL_PATH} ({MODEL_TYPE})")
        """

def ai_predict(text: str) -> List[Dict]:
    """Kembalikan daftar saran (dummy atau model beneran)."""
    if MODEL is None:
        load_model()

    if MODEL == "dummy":
        # Dummy logic
        suggestions = []
        if len(text.split()) > 20:
            suggestions.append({
                "sentence": text,
                "suggestion": "Kalimat terlalu panjang, sebaiknya dipecah agar lebih ringkas.",
                "category": "kalimat_efektif",
                "confidence": 0.5,
                "source": "ai-dummy"
            })
        else:
            suggestions.append({
                "sentence": text,
                "suggestion": "Kalimat sudah cukup efektif.",
                "category": "kalimat_efektif",
                "confidence": 0.8,
                "source": "ai-dummy"
            })
        return suggestions
    
    return []

    """
    # Jika sudah pakai model HuggingFace
    results = []
    if MODEL_TYPE == "text2text":
        res = MODEL(text, max_length=256, truncation=True)
        suggestion = res[0]["generated_text"]
        results.append({
            "sentence": text,
            "suggestion": suggestion,
            "category": "gaya_bahasa",
            "confidence": None,
            "source": "ai"
        })
    elif MODEL_TYPE == "text-classification":
        res = MODEL(text)[0]  # ambil list of dicts
        top = max(res, key=lambda x: x["score"])
        suggestion = f"Label: {top['label']} (score={top['score']:.2f})"
        results.append({
            "sentence": text,
            "suggestion": suggestion,
            "category": "kalimat_efektif",
            "confidence": float(top["score"]),
            "source": "ai"
        })
    return results
    """