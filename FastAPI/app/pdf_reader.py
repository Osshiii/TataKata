import fitz  # PyMuPDF

def extract_text_from_pdf(content: bytes) -> str:
    try:
        doc = fitz.open(stream=content, filetype="pdf")
        full_text = "".join([page.get_text() for page in doc])
        return full_text
    except Exception as e:
        return ""
