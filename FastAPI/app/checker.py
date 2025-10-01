import re

def check_rules(text: str):
    errors = []

    if not re.match(r'^[A-Z]', text.strip()):
        errors.append("Kalimat harus dimulai dengan huruf kapital.")

    if re.search(r'\bdi[A-Za-z]', text):
        errors.append("Gunakan spasi setelah kata depan 'di'.")

    if not text.strip().endswith(('.', '!', '?')):
        errors.append("Kalimat harus diakhiri tanda baca (., !, ?).")

    return errors
