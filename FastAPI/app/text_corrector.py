# def apply_corrections(text, errors):
#     corrected = text
#     manual_review = []  # simpan rule yang tidak bisa dikoreksi otomatis

#     for err in errors:
#         rule_id = err.get("rule_id")
#         original = err.get("original")
#         suggestion = err.get("suggestion")

#         # Cek apakah rule bisa dikoreksi otomatis
#         if original and suggestion:
#             # Gunakan replace hanya untuk teks yang masih ada
#             if original in corrected:
#                 corrected = corrected.replace(original, suggestion)
#         else:
#             # Simpan yang perlu direview manual (tidak ada original/suggestion)
#             manual_review.append({
#                 "rule_id": rule_id,
#                 "message": err.get("message")
#             })

#     return corrected, manual_review

# udah bisa
# def apply_corrections(text, errors, debug=False):
#     corrected = text
#     manual_review = []  # simpan rule yang tidak bisa dikoreksi otomatis

#     for err in errors:
#         rule_id = err.get("rule_id")
#         original = err.get("original")
#         suggestion = err.get("suggestion")

#         # kalau ada suggestion, bisa dikoreksi otomatis
#         if original and suggestion:
#             if original in corrected:
#                 corrected = corrected.replace(original, suggestion)
#         else:
#             # kalau tidak bisa dikoreksi otomatis, masuk ke review manual
#             manual_review.append({
#                 "rule_id": rule_id,
#                 "message": err.get("message")
#             })

#     # kalau mode debug, tampilkan semuanya (seperti sebelumnya)
#     if debug:
#         return corrected.strip().capitalize(), manual_review

#     # kalau bukan debug, return hanya teks yang sudah dikoreksi
#     return corrected.strip().capitalize()

import re

def apply_corrections(text, errors, debug=False):
    corrected = text
    manual_review = []

    for err in errors:
        rule_id = err.get("rule_id")
        original = err.get("original")
        suggestion = err.get("suggestion")

        if original and suggestion:
            pattern = r'\b' + re.escape(original) + r'\b'
            corrected = re.sub(pattern, suggestion, corrected)
        else:
            manual_review.append({
                "rule_id": rule_id,
                "message": err.get("message")
            })
            
    # Pastikan huruf pertama kalimat kapital, tanpa menurunkan kapitalisasi lain
    if corrected:
        corrected = corrected[0].upper() + corrected[1:]

    if debug:
        return corrected.strip(), manual_review

    return corrected.strip()


