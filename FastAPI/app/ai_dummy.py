# app/ai_dummy.py

def ai_check(text: str):
    if len(text.split()) > 20:
        return ["(AI dummy) Kalimat ini terlalu panjang, sebaiknya dipecah agar lebih ringkas."]
    else:
        return ["(AI dummy) Kalimat sudah cukup efektif."]
