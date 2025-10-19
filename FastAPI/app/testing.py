# from app.rules import (
#     # check_huruf_kapital,
#     # check_tanda_baca_akhir,
#     # check_tanda_baca_berulang,
#     # check_spasi_setelah_koma,
#     # check_kata_penghubung_di_awal,
#     # check_kata_depan,
#     # # check_di_imbuhan,
#     # check_gabungan_kata,
#     # check_kata_ganti,
#     # check_tanda_petik,
#     # check_titik_dua,
#     # check_singkatan,
#     # check_bentuk_ulang,
#     # check_kata_sandang,
#     check_kata_berimbuhan,
#     # check_partikel,
#     # check_angka
# )

# test_cases = [
#     "di makan nasi",              # ❌ salah → 'dimakan'
#     "ber jalan ke pasar",         # ❌ salah → 'berjalan'
#     "mem baca buku",              # ❌ salah → 'membaca'
#     "di rumah saja",              # ✅ benar → bukan kata kerja
#     "menulis surat",              # ✅ benar → tidak dipisah
#     "di ambil oleh guru",         # ❌ salah → 'diambil'
#     "peng lihat hasil",           # ❌ salah → 'penglihat'
#     "ke luar negeri",             # ❌ salah → 'keluar'
#     "bermain bola",               # ✅ benar → tidak dipisah
#     "penyanyi itu terkenal",      # ✅ benar → tidak dipisah
# ]

# for text in test_cases:
#     result = check_kata_berimbuhan(text)
#     print(f"Input: {text}")
#     if result:
#         for err in result:
#             print(f"❌ {err['message']}")
#     else:
#         print("✅ Tidak ada kesalahan")
#     print("-" * 40)