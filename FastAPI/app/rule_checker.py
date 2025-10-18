from TataKata.FastAPI.app.rules import (
    check_huruf_kapital,
    check_tanda_baca_akhir,
    check_tanda_baca_berulang,
    check_spasi_setelah_koma,
    check_kata_penghubung_di_awal,
    check_kata_depan,
    check_di_imbuhan,
    check_gabungan_kata,
    check_kata_ganti,
    check_tanda_petik,
    check_titik_dua
)


def check_rules(text: str):
    errors = []
    errors += check_huruf_kapital(text)
    errors += check_tanda_baca_akhir(text)
    errors += check_tanda_baca_berulang(text)
    errors += check_spasi_setelah_koma(text)
    errors += check_kata_penghubung_di_awal(text)
    errors += check_kata_depan(text)
    errors += check_di_imbuhan(text)
    errors += check_gabungan_kata(text)
    errors += check_kata_ganti(text)
    errors += check_tanda_petik(text)
    errors += check_titik_dua(text)
    return errors
