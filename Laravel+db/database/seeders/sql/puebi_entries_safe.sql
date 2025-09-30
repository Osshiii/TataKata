CREATE DATABASE IF NOT EXISTS puebi
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE puebi;

CREATE TABLE IF NOT EXISTS puebi_entries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    slug VARCHAR(255),
    title TEXT,
    path TEXT,
    content_markdown LONGTEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('index', 'Pedoman Umum Ejaan Bahasa Indonesia (PUEBI)', 'index.md', '# Pedoman Umum Ejaan Bahasa Indonesia (PUEBI)

PUEBI Daring adalah versi web ramah gawai dari *Pedoman Umum Ejaan Bahasa Indonesia* (PUEBI) Permendikbud 50/2015. Isi [PUEBI Daring](http://ivanlanin.github.io/puebi) diperkaya dengan beberapa catatan tambahan yang belum dinyatakan atau dinyatakan secara implisit pada dokumen asli [Permendikbud 50/2015](https://upload.wikimedia.org/wikipedia/commons/3/33/Peraturan_Menteri_Pendidikan_dan_Kebudayaan_Nomor_50_Tahun_2015_tentang_Pedoman_Umum_Ejaan_Bahasa_Indonesia.pdf).

Pada 28 Juli 2021, Badan Bahasa mengeluarkan [Keputusan Kepala Badan Bahasa 321/2021](https://badanbahasa.kemdikbud.go.id/lamanbahasa/sites/default/files/Salinan%20RKKB%20PUEBI.pdf) tentang Pedoman Umum Ejaan Bahasa Indonesia yang menggantikan Permendikbud 50/2015. Isi kedua dokumen itu kurang lebih sama sehingga isi PUEBI Daring ini masih belum perlu diubah.

## Daftar Isi

1. **[Pemakaian Huruf](huruf/index.md)**
	- [Huruf Abjad](huruf/huruf-abjad.md)
	- [Huruf Vokal](huruf/huruf-vokal.md)
	- [Huruf Konsonan](huruf/huruf-konsonan.md)
	- [Huruf Diftong](huruf/huruf-diftong.md)
	- [Gabungan Huruf Konsonan](huruf/gabungan-huruf-konsonan.md)
	- [Huruf Kapital](huruf/huruf-kapital.md)
	- [Huruf Miring](huruf/huruf-miring.md)
	- [Huruf Tebal](huruf/huruf-tebal.md)
2. **[Penulisan Kata](kata/index.md)**
	- [Kata Dasar](kata/kata-dasar.md)
	- [Kata Berimbuhan](kata/kata-berimbuhan.md)
	- [Bentuk Ulang](kata/bentuk-ulang.md)
	- [Gabungan Kata](kata/gabungan-kata.md)
	- [Pemenggalan Kata](kata/pemenggalan-kata.md)
	- [Kata Depan](kata/kata-depan.md)
	- [Partikel](kata/partikel.md)
	- [Singkatan dan Akronim](kata/singkatan-dan-akronim.md)
	- [Angka dan Bilangan](kata/angka-dan-bilangan.md)
	- [Kata Ganti](kata/kata-ganti.md)
	- [Kata Sandang](kata/kata-sandang.md)
3. **[Pemakaian Tanda Baca](tanda-baca/index.md)**
	- [Tanda Titik (.)](tanda-baca/tanda-titik.md)
	- [Tanda Koma (,)](tanda-baca/tanda-koma.md)
	- [Tanda Titik Koma (;)](tanda-baca/tanda-titik-koma.md)
	- [Tanda Titik Dua (:)](tanda-baca/tanda-titik-dua.md)
	- [Tanda Hubung (-)](tanda-baca/tanda-hubung.md)
	- [Tanda Pisah (—)](tanda-baca/tanda-pisah.md)
	- [Tanda Tanya (?)](tanda-baca/tanda-tanya.md)
	- [Tanda Seru (!)](tanda-baca/tanda-seru.md)
	- [Tanda Elipsis (…)](tanda-baca/tanda-elipsis.md)
	- [Tanda Petik ("…")](tanda-baca/tanda-petik.md)
	- [Tanda Petik Tunggal (''…'')](tanda-baca/tanda-petik-tunggal.md)
	- [Tanda Kurung ((…))](tanda-baca/tanda-kurung.md)
	- [Tanda Kurung Siku ([…])](tanda-baca/tanda-kurung-siku.md)
	- [Tanda Garis Miring (/)](tanda-baca/tanda-garis-miring.md)
	- [Tanda Penyingkat ('''')](tanda-baca/tanda-penyingkat-apostrof.md)
4. **[Penulisan Unsur Serapan](unsur-serapan/index.md)**

## Latar Belakang

Pada tanggal 30 November 2015, Permendiknas 46/2009 tentang Pedoman Umum Ejaan Bahasa Indonesia yang Disempurnakan (EYD) dicabut dan dinyatakan tidak berlaku karena digantikan oleh [Permendikbud 50/2015](https://upload.wikimedia.org/wikipedia/commons/3/33/Peraturan_Menteri_Pendidikan_dan_Kebudayaan_Nomor_50_Tahun_2015_tentang_Pedoman_Umum_Ejaan_Bahasa_Indonesia.pdf) tentang Pedoman Umum Ejaan Bahasa Indonesia (PUEBI). Naskah PUEBI yang beredar di internet umumnya berbentuk PDF sehingga sulit untuk ditelusuri oleh mesin pencari dan dirujuk dengan tautan spesifik. PUEBI seyogianya tersedia dalam format HTML agar memenuhi kebutuhan tersebut.

## Teknologi

Proyek ini adalah prakarsa semenjana untuk meningkatkan keterbacaan PUEBI dengan memanfaatkan [Markdown](http://daringfireball.net/projects/markdown/), [MkDocs](http://www.mkdocs.org/), dan [Github Pages](https://pages.github.com/). Proyek ini juga dimanfaatkan untuk membiasakan diri dengan [Sublime Text](https://www.sublimetext.com/) sebagai editor teks pengganti [EditPlus](https://www.editplus.com/) yang sudah memasuki masa pensiun.

## Hak Cipta

Hak cipta PUEBI dimiliki oleh [Badan Pengembangan dan Pembinaan Bahasa Republik Indonesia](http://badanbahasa.kemdikbud.go.id/). Penyuntingan dan pengatakan (*layout*) spesifik yang diterapkan pada situs ini diberi lisensi [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.id) oleh [@ivanlanin](https://twitter.com/ivanlanin).');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('huruf-tebal', 'H. Huruf Tebal', 'huruf/huruf-tebal.md', '# H. Huruf Tebal

!!! important ""
	**I.H.1** Huruf tebal dipakai untuk menegaskan bagian tulisan yang sudah ditulis miring.

Misalnya:

- Huruf *dh*, seperti pada kata *Rama**dh**an*, tidak terdapat dalam Ejaan Bahasa Indonesia yang Disempurnakan.
- Kata *et* dalam ungkapan *ora **et** labora* berarti ''dan''.

!!! note "Catatan"
	1. PUEBI 2015 menambahkan klausul ini.
	2. Huruf tebal *tidak* dipakai untuk menegaskan atau mengkhususkan huruf, bagian kata, kata, atau kelompok kata dalam kalimat. Untuk tujuan ini, gunakan [huruf miring](huruf-miring.md).

!!! important ""
	**I.H.2** Huruf tebal dapat dipakai untuk menegaskan bagian-bagian karangan, seperti judul buku, bab, atau subbab.

Misalnya:

- **1\\.1 Latar Belakang dan Masalah**
Kondisi kebahasaan di Indonesia yang diwarnai oleh satu bahasa standar dan ratusan bahasa daerah—ditambah beberapa bahasa asing, terutama bahasa Inggris— membutuhkan penanganan yang tepat dalam perencanaan bahasa. Agar lebih jelas, latar belakang dan masalah akan diuraikan secara terpisah seperti tampak pada paparan berikut.
- **1\\.1\\.1 Latar Belakang**
Masyarakat Indonesia yang heterogen menyebabkan munculnya sikap yang beragam terhadap penggunaan bahasa yang ada di Indonesia, yaitu (1) sangat bangga terhadap bahasa asing, (2) sangat bangga terhadap bahasa daerah, dan (3) sangat bangga terhadap bahasa Indonesia.
- **1\\.1\\.2 Masalah**
Penelitian ini hanya membatasi masalah pada sikap bahasa masyarakat Kalimantan terhadap ketiga bahasa yang ada di Indonesia. Sikap masyarakat tersebut akan digunakan sebagai formulasi kebijakan perencanaan bahasa yang diambil.
- **1\\.2 Tujuan**
Penelitian ini bertujuan untuk mengetahui dan mengukur sikap bahasa masyarakat Kalimantan, khususnya yang tinggal di kota besar terhadap bahasa Indonesia, bahasa daerah, dan bahasa asing.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('gabungan-huruf-konsonan', 'E. Gabungan Huruf Konsonan', 'huruf/gabungan-huruf-konsonan.md', '# E. Gabungan Huruf Konsonan

Gabungan huruf konsonan *kh*, *ng*, *ny*, dan *sy* masing-masing melambangkan satu bunyi konsonan.

Gabungan Huruf Konsonan | Posisi Awal | Posisi Tengah | Posisi Akhir
- | - | - | -
kh | *kh*usus | a*kh*ir | tari*kh*
ng | *ng*arai | ba*ng*un | sena*ng*
ny | *ny*ata | ba*ny*ak | -
sy | *sy*arat | mu*sy*awarah | ara*sy*');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('huruf-diftong', 'D. Huruf Diftong', 'huruf/huruf-diftong.md', '# D. Huruf Diftong

Di dalam bahasa Indonesia terdapat empat diftong yang dilambangkan dengan gabungan huruf vokal *ai*, *au*, *ei*, dan *oi*.

Huruf Diftong | Posisi Awal | Posisi Tengah | Posisi Akhir
- | - | - | -
ai | - | bal*ai*rung | pand*ai*
au | *au*todidak | t*au*fik | harim*au*
ei* | *ei*gendom | g*ei*ser | surv*ei*
oi | - | b*oi*kot | amb*oi*

!!! note "Catatan"
	PUEBI 2015 menambahkan diftong *ei*. Pedoman ejaan sebelumnya hanya mencantumkan tiga diftong: *ai*, *au*, dan *oi*.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('huruf-miring', 'G. Huruf Miring', 'huruf/huruf-miring.md', '# G. Huruf Miring

!!! important ""
	**I.G.1** Huruf miring dipakai untuk menuliskan judul buku, nama majalah, atau nama surat kabar yang dikutip dalam tulisan, termasuk dalam daftar pustaka.

Misalnya:

- Saya sudah membaca buku *Salah Asuhan* karangan Abdoel Moeis.
- Majalah *Poedjangga Baroe* menggelorakan semangat kebangsaan.
- Berita itu muncul dalam surat kabar *Cakrawala*.
- Pusat Bahasa. 2011. *Kamus Besar Bahasa Indonesia Pusat Bahasa*. Edisi Keempat (Cetakan Kedua). Jakarta: Gramedia Pustaka Utama.

!!! important ""
	**I.G.2** Huruf miring dipakai untuk menegaskan atau mengkhususkan huruf, bagian kata, kata, atau kelompok kata dalam kalimat.

Misalnya:

- Huruf terakhir kata *abad* adalah *d*.
- Dia tidak *di*antar, tetapi *meng*antar.
- Dalam bab ini *tidak* dibahas pemakaian tanda baca.
- Buatlah kalimat dengan menggunakan ungkapan *lepas tangan*.

!!! important ""
	**I.G.3** Huruf miring dipakai untuk menuliskan kata atau ungkapan dalam bahasa daerah atau bahasa asing.

Misalnya:

- Upacara *peusijuek* (tepung tawar) menarik perhatian wisatawan asing yang berkunjung ke Aceh.
- Nama ilmiah buah manggis ialah *Garcinia mangostana*.
- *Weltanschauung* bermakna ''pandangan dunia''.
- Ungkapan *bhinneka tunggal ika* dijadikan semboyan negara Indonesia.

Catatan:

(1) Nama diri, seperti nama orang, lembaga, atau organisasi, dalam bahasa asing atau bahasa daerah *tidak* ditulis dengan huruf miring.

(2) Dalam naskah tulisan tangan atau mesin tik (bukan komputer), bagian yang akan dicetak miring ditandai dengan garis bawah.

(3) Kalimat atau teks berbahasa asing atau berbahasa daerah yang dikutip secara langsung dalam teks berbahasa Indonesia ditulis dengan huruf miring.

!!! note "Catatan"
	1. PUEBI 2015 menggunakan frasa *bahasa daerah atau bahasa asing*, sedangkan pedoman ejaan sebelumnya memakai frasa *bukan bahasa Indonesia*.
	2. PUEBI 2015 menambahkan catatan bahwa nama diri dalam bahasa asing atau bahasa daerah *tidak* ditulis dengan huruf miring.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('huruf-vokal', 'B. Huruf Vokal', 'huruf/huruf-vokal.md', '# B. Huruf Vokal

Huruf yang melambangkan vokal dalam bahasa Indonesia terdiri atas lima huruf, yaitu *a*, *e*, *i*, *o*, dan *u*.

Huruf Vokal | Posisi Awal | Posisi Tengah | Posisi Akhir
- | - | - | -
a | *a*pi | p*a*di | lus*a*
e* | *e*nak | p*e*tak | sor*e*
&nbsp; | *e*mber | p*e*ndek | -
&nbsp; | *e*mas | k*e*na | tip*e*
i | *i*tu | s*i*mpan | murn*i*
o | *o*leh | k*o*ta | radi*o*
u | ulang | bumi | ibu

Keterangan:

\\* Untuk pengucapan (pelafalan) kata yang benar, diakritik berikut ini dapat digunakan jika ejaan kata itu dapat menimbulkan keraguan.

a. Diakritik (é) dilafalkan [e]. Misalnya:

- Anak-anak bermain di *teras* (téras).
- Kedelai merupakan bahan pokok *kecap* (kécap).

b. Diakritik (è) dilafalkan [ɛ]. Misalnya:

- Kami menonton film *seri* (sèri).
- Pertahanan *militer* (militèr) Indonesia cukup kuat.

c. Diakritik (ê) dilafalkan [ə]. Misalnya:

- Pertandingan itu berakhir *seri* (sêri).
- Upacara itu dihadiri pejabat *teras* (têras) Bank Indonesia.
- *Kecap* (kêcap) dulu makanan itu.

!!! note "Catatan"
	PUEBI 2015 menambahkan informasi pelafalan diakritik *é* (taling terbuka), *è *(taling tertutup), dan *ê* (pepet). Pedoman ejaan sebelumnya hanya mencantumkan tanda aksen (′).');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('index', 'I. Pemakaian Huruf', 'huruf/index.md', '# I. Pemakaian Huruf

A. [Huruf Abjad](huruf-abjad.md)  
B. [Huruf Vokal](huruf-vokal.md)  
C. [Huruf Konsonan](huruf-konsonan.md)  
D. [Huruf Diftong](huruf-diftong.md)  
E. [Gabungan Huruf Konsonan](gabungan-huruf-konsonan.md)  
F. [Huruf Kapital](huruf-kapital.md)  
G. [Huruf Miring](huruf-miring.md)  
H. [Huruf Tebal](huruf-tebal.md)');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('huruf-konsonan', 'C. Huruf Konsonan', 'huruf/huruf-konsonan.md', '# C. Huruf Konsonan

Huruf yang melambangkan konsonan dalam bahasa Indonesia terdiri atas 21 huruf, yaitu *b*, *c*, *d*, *f*, *g*, *h*, *j*, *k*, *l*, *m*, *n*, *p*, *q*, *r*, *s*, *t*, *v*, *w*, *x*, *y*, dan *z*.

Huruf Konsonan | Posisi Awal | Posisi Tengah | Posisi Akhir
- | - | - | -
b | *b*ahasa | se*b*ut | ada*b*
c | *c*akap | ka*c*a | -
d | *d*ua | a*d*a | aba*d*
f | *f*akir | ka*f*an | maa*f*
g | *g*una | ti*g*a | gude*g*
h | *h*ari | sa*h*am | tua*h*
j | *j*alan | man*j*a | mikra*j*
k | *k*ami | pa*k*sa | politi*k*
l | *l*ekas | a*l*as | aka*l*
m | *m*aka | ka*m*i | dia*m*
n | *n*ama | ta*n*ah | dau*n*
p | *p*asang | a*p*a | sia*p*
q* | *q*ariah | i*q*ra | -
r | *r*aih | ba*r*a | puta*r*
s | *s*ampai | a*s*li | tangka*s*
t | *t*ali | ma*t*a | rapa*t*
v | *v*ariasi | la*v*a | moloto*v*
w | *w*anita | ha*w*a | takra*w*
x* | *x*enon | - | -
y | *y*akin | pa*y*ung | -
z | *z*eni | la*z*im | ju*z*

Keterangan:

\\* Huruf *q* dan *x* khusus digunakan untuk nama diri dan keperluan ilmu. Huruf *x* pada posisi awal kata diucapkan [s].

!!! note "Catatan"
	1. PUEBI 2015 menghilangkan keterangan "Huruf *k* melambangkan bunyi hamzah" dengan contoh "ra*k*yat" dan "bapa*k*".
	2. Empat konsonan (*c*, *q*, *x*, dan *y*) tidak digunakan di posisi akhir kata dasar bahasa Indonesia. Konsonan *y* bisa terletak di akhir, tetapi dalam bentuk gabungan huruf konsonan *sy*, misalnya pada *arasy*.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('huruf-abjad', 'A. Huruf Abjad', 'huruf/huruf-abjad.md', '# A. Huruf Abjad

Abjad yang dipakai dalam ejaan bahasa Indonesia terdiri atas 26 huruf berikut.

Kapital | Nonkapital | Nama | Pengucapan
- | - | - | -
A | a | a | a
B | b | be | bé
C | c | ce | cé
D | d | de | dé
E | e | e | é
F | f | ef | èf
G | g | ge | gé
H | h | ha | ha
I | i | i | i
J | j | je | jé
K | k | ka | ka
L | l | el | èl
M | m | em | èm
N | n | en | èn
O | o | o | o
P | p | pe | pé
Q | q | ki | ki
R | r | er | èr
S | s | es | ès
T | t | te | té
U | u | u | u
V | v | ve | vé
W | w | we | wé
X | x | eks | èks
Y | y | ye | yé
Z | z | zet | zèt

!!! note "Catatan"
	PUEBI 2015 menambahkan kolom "Pengucapan" yang dilengkapi [diakritik](../huruf-vokal/).');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('huruf-kapital', 'F. Huruf Kapital', 'huruf/huruf-kapital.md', '# F. Huruf Kapital

!!! important ""
	**I.F.1** Huruf kapital dipakai sebagai huruf pertama awal kalimat.

Misalnya:

- *A*pa maksudnya?
- *D*ia membaca buku.
- *K*ita harus bekerja keras.
- *P*ekerjaan itu akan selesai dalam satu jam.

!!! important ""
	**I.F.2** Huruf kapital dipakai sebagai huruf pertama unsur nama orang, termasuk julukan.

Misalnya:

- *A*mir *H*amzah
- *D*ewi *S*artika
- *H*alim *P*erdanakusumah
- *W*age *R*udolf *S*upratman
- *J*enderal *K*ancil
- *D*ewa *P*edang
- *A*lessandro *V*olta
- *A*ndré-*M*arie *A*mpère
- *M*ujair
- *R*udolf *D*iesel

Catatan:

(1) Huruf kapital *tidak* dipakai sebagai huruf pertama nama orang yang merupakan nama jenis atau satuan ukuran.

Misalnya:

- ikan *m*ujair
- *m*esin *d*iesel
- 5 *a*mpere
- 10 *v*olt

(2) Huruf kapital *tidak* dipakai untuk menuliskan huruf pertama kata yang bermakna ''anak dari'', seperti *bin*, *binti*, *boru*, dan *van*, atau huruf pertama kata tugas.

Misalnya:

- Abdul Rahman *b*in Zaini
- Siti Fatimah *b*inti Salim
- Indani *b*oru Sitanggang
- Charles Adriaan *v*an Ophuijsen
- Ayam Jantan *d*ari Timur
- Mutiara *d*ari Selatan

!!! note "Catatan"
	PUEBI 2015 menambahkan (1) penjelasan "termasuk julukan" pada I.F.2., misalnya *Jendral Kancil* dan *Dewa Pedang*; serta (2) penjelasan "yang bermakna ''anak dari''" pada catatan kedua. Kedua tambahan ini tampaknya bertujuan untuk memperjelas pedoman sebelumnya.

!!! important ""
	**I.F.3** Huruf kapital dipakai pada awal kalimat dalam petikan langsung.

Misalnya:

- Adik bertanya, "*K*apan kita pulang?"
- Orang itu menasihati anaknya, "*B*erhati-hatilah, Nak!"
- "*M*ereka berhasil meraih medali emas," katanya.
- "*B*esok pagi," katanya, "mereka akan berangkat."

!!! important ""
	**I.F.4** Huruf kapital dipakai sebagai huruf pertama setiap kata nama agama, kitab suci, dan Tuhan, termasuk sebutan dan kata ganti untuk Tuhan.

Misalnya:

- *I*slam
- *A*lquran
- *K*risten
- *A*lkitab
- *H*indu
- *W*eda
- *A*llah
- *T*uhan
- Allah akan menunjukkan jalan kepada hamba-*N*ya.
- Ya, *T*uhan, bimbinglah hamba-*M*u ke jalan yang *E*ngkau beri rahmat.

!!! important ""
	**I.F.5.a** Huruf kapital dipakai sebagai huruf pertama unsur nama gelar kehormatan, keturunan, keagamaan, atau akademik yang diikuti nama orang, termasuk gelar akademik yang mengikuti nama orang.

Misalnya:

- *S*ultan Hasanuddin
- *M*ahaputra Yamin
- *H*aji Agus Salim
- *I*mam Hambali
- *N*abi Ibrahim
- *R*aden Ajeng Kartini
- *D*oktor Mohammad Hatta
- Agung Permana, *S*arjana *H*ukum
- Irwansyah, *M*agister *H*umaniora

!!! important ""
	**I.F.5.b** Huruf kapital dipakai sebagai huruf pertama unsur nama gelar kehormatan, keturunan, keagamaan, profesi, serta nama jabatan dan kepangkatan yang dipakai sebagai sapaan.

Misalnya:

- Selamat datang, *Y*ang *M*ulia.
- Semoga berbahagia, *S*ultan.
- Terima kasih, *K*iai.
- Selamat pagi, *D*okter.
- Silakan duduk, *P*rof.
- Mohon izin, *J*enderal.

!!! important ""
	**I.F.6** Huruf kapital dipakai sebagai huruf pertama unsur nama jabatan dan pangkat yang diikuti nama orang atau yang dipakai sebagai pengganti nama orang tertentu, nama instansi, atau nama tempat.

Misalnya:

- *W*akil *P*residen Adam Malik
- *P*erdana *M*enteri Nehru
- *P*rofesor Supomo
- *L*aksamana *M*uda *U*dara Husein Sastranegara
- *P*roklamator Republik Indonesia (Soekarno-Hatta)
- *S*ekretaris *J*enderal Kementerian Pendidikan dan Kebudayaan
- *G*ubernur Papua Barat

!!! important ""
	**I.F.7** Huruf kapital dipakai sebagai huruf pertama nama bangsa, suku bangsa, dan bahasa.

Misalnya:

- bangsa *I*ndonesia
- suku *D*ani
- bahasa *B*ali

Catatan: Nama bangsa, suku bangsa, dan bahasa yang dipakai sebagai bentuk dasar kata turunan tidak ditulis dengan huruf awal kapital.

Misalnya:

- peng*i*ndonesiaan kata asing
- ke*i*nggris-*i*nggrisan
- ke*j*awa-*j*awaan

!!! important ""
	**I.F.8.a** Huruf kapital dipakai sebagai huruf pertama nama tahun, bulan, hari, dan hari besar atau hari raya.

Misalnya:

- tahun *H*ijriah
- tarikh *M*asehi
- bulan *A*gustus
- bulan *M*aulid
- hari *J*umat
- hari *G*alungan
- hari *L*ebaran
- hari *N*atal

!!! important ""
	**I.F.8.b** Huruf kapital dipakai sebagai huruf pertama unsur nama peristiwa sejarah.

Misalnya:

- *K*onferensi *A*sia *A*frika
- *P*erang *D*unia II
- *P*roklamasi *K*emerdekaan Indonesia

Catatan: Huruf pertama peristiwa sejarah yang tidak dipakai sebagai nama tidak ditulis dengan huruf kapital.

Misalnya:

- Soekarno dan Hatta mem*proklamasikan kemerdekaan* bangsa Indonesia.
- Perlombaan senjata membawa risiko pecahnya *perang dunia*.

!!! important ""
	**I.F.9** Huruf kapital dipakai sebagai huruf pertama nama geografi.

Misalnya:

- *J*akarta
- *A*sia *T*enggara
- *P*ulau *M*iangas
- *A*merika *S*erikat
- *B*ukit *B*arisan
- *J*awa *B*arat
- *D*ataran *T*inggi
- *D*ieng *D*anau *T*oba
- *J*alan *S*ulawesi
- *G*unung *S*emeru
- *N*garai *S*ianok
- *J*azirah *A*rab
- *S*elat *L*ombok
- *L*embah *B*aliem
- *S*ungai *M*usi
- *P*egunungan *H*imalaya
- *T*eluk *B*enggala
- *T*anjung *H*arapan
- *T*erusan *S*uez
- *K*ecamatan *C*icadas
- *G*ang *K*elinci
- *K*elurahan *R*awamangun

Catatan:

(1) Huruf pertama nama geografi yang bukan nama diri *tidak* ditulis dengan huruf kapital.

Misalnya:

- berlayar ke *t*eluk mandi di *s*ungai
- menyeberangi *s*elat berenang di *d*anau

(2) Huruf pertama nama diri geografi yang dipakai sebagai nama jenis *tidak* ditulis dengan huruf kapital.

Misalnya:

- jeruk *b*ali (*Citrus maxima*)
- kacang *b*ogor (*Voandzeia subterranea*)
- nangka *b*elanda (*Anona muricata*)
- petai *c*ina (*Leucaena glauca*)

Nama yang disertai nama geografi dan merupakan nama jenis dapat dikontraskan atau disejajarkan dengan nama jenis lain dalam kelompoknya.

Misalnya:

- Kita mengenal berbagai macam gula, seperti gula *j*awa, gula *p*asir, gula *t*ebu, gula *a*ren, dan gula *a*nggur.
- Kunci *i*nggris, kunci *t*olak, dan kunci *r*ing mempunyai fungsi yang berbeda.

Contoh berikut *bukan* nama jenis.

- Dia mengoleksi batik *C*irebon, batik *P*ekalongan, batik *S*olo, batik *Y*ogyakarta, dan batik *M*adura.
- Selain film H**ongkong, juga akan diputar film *I*ndia, film *K*orea, dan film *J*epang.
- Murid-murid sekolah dasar itu menampilkan tarian *S*umatra *S*elatan, tarian *K*alimantan *T*imur, dan tarian *S*ulawesi *S*elatan.

!!! note "Catatan"
	PUEBI 2015 menambahkan cara pembedaan unsur nama geografi yang menjadi bagian nama diri (*proper name*) dan nama jenis (*common name*).

!!! important ""
	**I.F.10** Huruf kapital dipakai sebagai huruf pertama semua kata (termasuk semua unsur [bentuk ulang](../../kata/bentuk-ulang) sempurna) dalam nama negara, lembaga, badan, organisasi, atau dokumen, *kecuali* kata tugas, seperti *di*, *ke*, *dari*, *dan*, *yang*, dan *untuk*.

Misalnya:

- *R*epublik *I*ndonesia
- *M*ajelis *P*ermusyawaratan *R*akyat *R*epublik *I*ndonesia
- *I*katan *A*hli *K*esehatan *M*asyarakat *I*ndonesia
- *P*eraturan *P*residen *R*epublik *I*ndonesia *N*omor 16 *T*ahun 2010 tentang *P*enggunaan *B*ahasa *I*ndonesia dalam *P*idato *P*residen dan/atau *W*akil *P*residen serta *P*ejabat *L*ainnya
- *P*erserikatan *B*angsa-Bangsa
- *K*itab *U*ndang-Undang *H*ukum *P*idana

!!! important ""
	**I.F.11** Huruf kapital dipakai sebagai huruf pertama setiap kata (termasuk unsur [kata ulang](../../kata/bentuk-ulang) sempurna) di dalam judul buku, karangan, artikel, dan makalah serta nama majalah dan surat kabar, *kecuali* kata tugas, seperti *di*, *ke*, *dari*, *dan*, *yang*, dan *untuk*, yang tidak terletak pada posisi awal.

Misalnya:

- Saya telah membaca buku Dari *A*ve *M*aria ke *J*alan *L*ain ke *R*oma.
- Tulisan itu dimuat dalam majalah *B*ahasa dan *S*astra.
- Dia agen surat kabar *S*inar *P*embangunan.
- Ia menyajikan makalah "*P*enerapan *A*sas-*A*sas *H*ukum *P*erdata".

!!! important ""
	**I.F.12** Huruf kapital dipakai sebagai huruf pertama unsur singkatan nama gelar, pangkat, atau sapaan.

Misalnya:

- *S*.*H*. = sarjana hukum
- *S*.*K*.*M*. = sarjana kesehatan masyarakat
- *S*.*S*. = sarjana sastra
- *M*.*A*. = *master of arts*
- *M*.*H*um. = magister humaniora
- *M*.*S*i. = magister sains
- *K*.*H*. = kiai haji
- *H*j. = hajah
- *M*gr. = *monseigneur*
- *P*dt. = pendeta
- *D*g. = daeng
- *D*t. = datuk
- *R*.*A*. = raden ayu
- *S*t. = sutan
- *T*b. = tubagus
- *D*r. = doktor
- *P*rof. = profesor
- *T*n. = tuan
- *N*y. = nyonya
- *S*dr. = saudara

!!! note "Catatan"
	PUEBI 2015 menambahkan contoh gelar lokal *Daeng* dan *Datuk*.

!!! important ""
	**I.F.13** Huruf kapital dipakai sebagai huruf pertama kata penunjuk hubungan kekerabatan, seperti *bapak*, *ibu*, *kakak*, *adik*, dan *paman*, serta kata atau ungkapan lain yang dipakai dalam penyapaan atau pengacuan.

Misalnya:

- "Kapan *B*apak berangkat?" tanya Hasan. Dendi bertanya, "Itu apa, Bu?"
- "Silakan duduk, *D*ik!" kata orang itu.
- Surat *S*audara telah kami terima dengan baik.
- "Hai, *K*utu *B*uku, sedang membaca apa?"
- "*B*u, saya sudah melaporkan hal ini kepada *B*apak."

!!! note "Catatan"
	PUEBI 2015 menambahkan penjelasan penulisan kata atau ungkapan lain yang digunakan sebagai penyapaan ditulis dengan huruf kapital, misalnya *Kutu Buku*.

Catatan:

(1) Istilah kekerabatan berikut *bukan* merupakan penyapaan atau pengacuan.

Misalnya:

- Kita harus menghormati *b*apak dan *i*bu kita.
- Semua *k*akak dan *a*dik saya sudah berkeluarga.

(2) Kata ganti *Anda* ditulis dengan huruf awal kapital.

Misalnya:

- Sudahkah *A*nda tahu?
- Siapa nama *A*nda?');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('index', 'IV. Penulisan Unsur Serapan', 'unsur-serapan/index.md', '# IV. Penulisan Unsur Serapan

Dalam perkembangannya bahasa Indonesia menyerap unsur dari berbagai bahasa, baik dari bahasa daerah, seperti bahasa Jawa, Sunda, dan Bali, maupun dari bahasa asing, seperti bahasa Sanskerta, Arab, Portugis, Belanda, Cina, dan Inggris. Berdasarkan taraf integrasinya, unsur serapan dalam bahasa Indonesia dapat dibagi menjadi dua kelompok besar.

Pertama, unsur asing yang belum sepenuhnya terserap ke dalam bahasa Indonesia, seperti *force majeur*, *de facto*, *de jure*, dan *l''exploitation de l''homme par l''homme*. Unsur-unsur itu dipakai dalam konteks bahasa Indonesia, tetapi cara pengucapan dan penulisannya masih mengikuti cara asing.

Kedua, unsur asing yang penulisan dan pengucapannya disesuaikan dengan kaidah bahasa Indonesia. Dalam hal ini, penyerapan diusa-hakan agar ejaannya diubah seperlunya sehingga bentuk Indonesianya masih dapat dibandingkan dengan bentuk asalnya.

Kaidah ejaan yang berlaku bagi unsur serapan itu adalah sebagai berikut.

***


**a** (Arab, bunyi pendek atau bunyi panjang) menjadi *a* (bukan *o*)

|     |     |     |
| --- | --- | --- |
| m**a**żhab |  (مذهب) |  m*a*zhab |
| q**a**dr |  (قدر) |  k*a*dar |
| ṣ**a**ḥā*bat*   | (صحابة) | s*a*habat |
| h**a**qīq**a**t | (حقيقة) | h*a*kikat |
| ''umr**a**h      | (عمرة)  | umr*a*h   |
| g**ā**''ib       | (غائب)  | g*a*ib    |
| iq**ā**mah      | (إقامة) | ik*a*mah  |
| kh**ā**tib      | (خاطب)  | kh*a*tib  |
| riḍ**ā**''       | (رضاء)  | rid*a*    |
| ẓ**ā**lim       | (ظالم)  | z*a*lim   |

**''ain** (ع Arab), pada awal suku kata menjadi *a*, *i*, *u*

|     |     |     |
| --- | --- | --- |
| **''a**jā''ib |  (عجائب) |  *a*jaib |
| sa**''ā**dah |  (سعادة) |  sa*a*dah |
| **''i**lm |  (علم) |  *i*lmu |
| qā**''i**dah |  (قاعدة) |  ka*i*dah |
| **''u**zr |  (عذر) |  *u*zur |
| ma**''ū**nah |  (معونة) |  ma*u*nah |

**''ain** (ﻉ Arab) di akhir suku kata menjadi *k*

|     |     |     |
| --- | --- | --- |
| ''i**''**tiqā*d* |  (إعتقاد) |  i*k*tikad |
| mu**''**jizat |  (معجزة) |  mu*k*jizat |
| ni**''**mat |  (نعمة) |  ni*k*mat |
| rukū**''** |  (ركوع) |  ruku*k* |
| simā**''** |  (سماع) |  sima*k* |
| ta**''**rīf |  (تعريف) |  ta*k*rif |

**aa** (Belanda) menjadi *a*

|     |     |
| --- | --- |
| p**aa**l |  p*a*l |
| b**aa**l |  b*a*l |
| oct**aa**f |  okt*a*f |

**ae** tetap *ae* jika tidak bervariasi dengan *e*

|     |     |
| --- | --- |
| **ae**robe |  *ae*rob |
| **ae**rodinamics |  *ae*rodinamika |

**ae**, jika bervariasi dengan *e*, menjadi *e*

|     |     |
| --- | --- |
| h**ae**moglobin |  h*e*moglobin |
| h**ae**matite |  h*e*matit |

**ai** tetap *ai*

|     |     |
| --- | --- |
| tr**ai**ler |  tr*ai*ler |
| c**ai**sson |  k*ai*son |

**au** tetap *au*

|     |     |
| --- | --- |
| **au**diogram |  *au*diogram |
| **au**totroph |  *au*totrof |
| t**au**tomer |  t*au*tomer |
| hydr**au**lic |  hidr*au*lik |
| c**au**stic |  k*au*stik |

***


**c** di depan *a*, *u*, *o*, dan konsonan menjadi *k*

|     |     |
| --- | --- |
| **c**alomel |  *k*alomel |
| **c**onstruction |  *k*onstruksi |
| **c**ubic |  *k*ubik |
| **c**oup |  *k*up |
| **c**lassification |  *k*lasifikasi |
| **c**rystal |  *k*ristal |

**c** di depan *e*, *i*, *oe*, dan *y* menjadi *s*

|     |     |
| --- | --- |
| **c**entral |  *s*entral |
| **c**ent |  *s*en |
| **c**irculation |  *s*irkulasi |
| **c**oelom |  *s*elom |
| **c**ybernetics |  *s*ibernetika |
| **c**ylinder |  *s*ilinder |

**cc** di depan *o*, *u*, dan konsonan menjadi *k*

|     |     |
| --- | --- |
| a**cc**omodation |  a*k*omodasi |
| a**cc**ulturation |  a*k*ulturasi |
| a**cc**limatization |  a*k*limatisasi |
| a**cc**umulation |  a*k*umulasi |
| a**cc**lamation |  a*k*lamasi |

**cc** di depan *e* dan *i* menjadi *ks*

|     |     |
| --- | --- |
| a**cc**ent |  a*k*sen |
| a**cc**essory |  a*k*sesori |
| va**cc**ine |  va*k*sin |

**cch** dan *ch* di depan *a*, *o*, dan konsonan menjadi *k*

|     |     |
| --- | --- |
| sa**cc**harin |  sa*k*arin |
| **ch**arisma |  *k*arisma |
| **ch**olera |  *k*olera |
| **ch**romosome |  *k*
| te**ch**nique |  te*k*nik |

**ch** yang lafalnya *s* atau *sy* menjadi *s*

|     |     |
| --- | --- |
| e**ch**elon |  e*s*elon |
| ma**ch**ine |  me*s*in |

**ch** yang lafalnya *c* menjadi *c*

**ç** (Sanskerta) menjadi *s*

|     |     |
| --- | --- |
| **ç**abda |  *s*abda |
| **ç**astra |  *s*astra |

***


**ḍad** (ﺽ Arab) menjadi *d*

|     |     |     |
| --- | --- | --- |
| ''af**ḍ**al |  (أفضل) |  af*d*al |
| **ḍ**a''īf  |  (ضعيف) |  *d*aif |
| far**ḍ** |  (فرض) |  far*d*u |
| hā**ḍ**ir |  (حاضر) |  ha*d*ir |

***


**e** tetap *e*

|     |     |
| --- | --- |
| **e**ff**e**ct |  *e*f*e*k |
| d**e**scription |  d*e*skripsi |
| synth**e**sis |  sint*e*sis |

**ea** tetap *ea*

|     |     |
| --- | --- |
| id**ea**list |  id*ea*lis |
| hab**ea**s |  hab*ea*s |

**ee** (Belanda) menjadi *e*

|     |     |
| --- | --- |
| stratosf**ee**r |  stratosf*e*r |
| syst**ee**m |  sist*e*m |

**ei** tetap *ei*

|     |     |
| --- | --- |
| **ei**cosane |  *ei*kosan |
| **ei**detic |  *ei*detik |
| **ei**nst**ei**nium |  *ei*nst*ei*nium |

**eo** tetap *eo*

|     |     |
| --- | --- |
| ster**eo** |  ster*eo* |
| g**eo**metry |  g*eo*metri |
| z**eo**lite |  z*eo*lit |

**eu** tetap *eu*

|     |     |
| --- | --- |
| n**eu**tron |  n*eu*tron |
| **eu**genol |  *eu*genol |
| **eu**ropium |  *eu*ropium |

***


**fa** (ﻑ Arab) menjadi *f*

|     |     |     |
| --- | --- | --- |
| ʼa**f**ḍal |  (أفضل) |  a*f*dal |
| ''āri**f** |  (عارف) |  ari*f* |
| **f**aqīr |  (فقير) |  *f*akir |
| **f**aṣīh |  (فصيح) |  *f*asih |
| ma**f**hūm |  (مفهوم) |  ma*f*hum |

**f** tetap *f*

|     |     |
| --- | --- |
| **f**anatic |  *f*anatik |
| **f**actor |  *f*aktor |
| **f**ossil |  *f*osil |

***


**gh** menjadi *g*

|     |     |
| --- | --- |
| **gh**anta |  *g*enta |
| sor**gh**um |  sor*g*um |

**gain** (غ Arab) menjadi *g*

|     |     |     |
| --- | --- | --- |
| **g**ā''ib |  (غائب) |  *g*aib |
| ma**g**firah |  (مغفرة) |  ma*g*firah |
| ma**g**rib |  (مغرب) |  ma*g*rib |

***


**ḥa** (ﺡ Arab) menjadi *h*

|     |     |     |
| --- | --- | --- |
| **ḥ**ākim |  (حاكم) |  *h*akim |
| iṣlā**ḥ** |  (إصلاح) |  isla*h* |
| si**ḥ**r |  (سحر) |  si*h*ir |

**hamzah** (ﺀ Arab) yang diikuti oleh vokal menjadi *a*, *i*, *u*

|     |     |     |
| --- | --- | --- |
| **''a**mr |  (أمر) |  *a*mar |
| mas**''a**lah |  (مسألة) |  mas*a*lah |
| ''iṣl**ā**ḥ |  (إصلاح) |  *i*slah |
| q**ā''**idah |  (قاعدة) |  k*a*idah |
| **''u**fuq |  (أفق) |  *u*fuk |

**hamzah** (ﺀ Arab) di akhir suku kata, kecuali di akhir kata, menjadi *k*

|     |     |     |
| --- | --- | --- |
| ta**''**wīl |  (تأويل) |  ta*k*wil |
| ma**''**mūm |  (مأموم) |  ma*k*mum |
| mu**''**mīn |  (مؤمن) |  mu*k*min |

**hamzah** (ﺀ Arab) di akhir kata dihilangkan

|     |     |     |
| --- | --- | --- |
| imlā**''** |  (إملاء) |  iml*a* |
| istinjā**''** |  (إستنجاء) |  istinj a/tinj*a* |
| munsyi**''** |  (منشىء) |  munsy*i* |
| wuḍū**''** |  (وضوء) |  wud*u* |

***


**i** (Arab, bunyi pendek atau bunyi panjang) menjadi *i*

|     |     |     |
| --- | --- | --- |
| **i**''t**i**qād  |  (إعتقاد) |  *i*kt*i*kad |
| musl**i**m |  (مسلم) |  musl*i*m |
| naṣ**ī**ḥah |  (نصيحة) |  nas*i*hat |
| ṣaḥ**ī**ḥ |  (صحيح) |  sah*i*h |

**i** pada awal suku kata di depan vokal tetap *i*

|     |     |
| --- | --- |
| **i**ambus |  *i*ambus |
| **i**on |  *i*on |
| **i**ota |  *i*ota |

**ie** (Belanda) menjadi *i* jika lafalnya *i*

|     |     |
| --- | --- |
| polit**ie**k |  polit*i*k |
| r**ie**m |  r*i*m |

**ie** tetap *ie* jika lafalnya bukan *i*

|     |     |
| --- | --- |
| var**ie**ty |  var*ie*tas |
| pat**ie**nt |  pas*ie*n |
| h**ie**rarchy |  hierarki |

***


**jim** (ﺝ Arab) menjadi *j*

|     |     |     |
| --- | --- | --- |
| **j**āriyah |  (جارية) |  *j*ariah |
| **j**anāzah |  (جنازة) |  *j*enazah |
| ʼi**j**āzah |  (إجازة) |  i*j*azah |

***


**kha** (ﺥ Arab) menjadi *kh*

|     |     |     |
| --- | --- | --- |
| **kh**uṣūṣ |  (خصوص) |  *kh*usus |
| ma**kh**lū*q* |  (مخلوق) |  ma*kh*luk |
| tārī**kh** |  (تاريخ) |  tari*kh* |

***


**ng** tetap *ng*

|     |     |
| --- | --- |
| conti**ng**ent |  konti*ng*en |
| co**ng**res  |  o*ng*res |
| li**ng**uistics |  li*ng*uistik |

***


**oe** ( oi Yunani) menjadi *e*

|     |     |
| --- | --- |
| f**oe**tus |  f*e*tus |
| **oe**strogen |  *e*strogen |
| **oe**nology |  *e*nologi |

**oo** (Belanda) menjadi *o*

|     |     |
| --- | --- |
| komf**oo**r |  komp*o*r |
| prov**oo**st |  prov*o*s |

**oo** (Inggris) menjadi *u*

|     |     |
| --- | --- |
| cart**oo**n |  kart*u*n |
| proof |  pr*u*f |
| p**oo**l |  p*u*l |

**oo** (vokal ganda) tetap *oo*

|     |     |
| --- | --- |
| z**oo**logy |  z*oo*logi |
| c**oo**rdination |  k*oo*rdinasi |

**ou** menjadi u jika lafalnya *u*

|     |     |
| --- | --- |
| g**ou**verneur |  g*u*bernur |
| c**ou**pon |  k*u*pon |
| cont**ou**r |  kont*u*r |

***


**ph** menjadi *f*

|     |     |
| --- | --- |
| **ph**ase |  *f*ase |
| **ph**ysiology |  *f*isiologi |
| spectogra**ph** |  spektogra*f* |

**ps** tetap *ps*

|     |     |
| --- | --- |
| **ps**eudo |  *ps*eudo |
| **ps**ychiatry |  *ps*ikiatri |
| **ps**ychic |  *ps*ikis |
| **ps**ychosomatic |  *ps*ikosomatik |

**pt** tetap *pt*

|     |     |
| --- | --- |
| **pt**erosaur |  *pt*erosaur |
| **pt**eridology |  *pt*eridologi |
| **pt**yalin |  *pt*ialin |

***


**q** menjadi *k*

|     |     |
| --- | --- |
| a**q**uarium |  a*k*uarium |
| fre**q**uency |  fre*k*uensi |
| e**q**uator |  e*k*uator |

**qaf** (ﻕ Arab) menjadi *k*

|     |     |     |
| --- | --- | --- |
| ''a**q**ī**q**ah |  (عقيقة) |  a*k*i*k*ah |
| ma**q**ām |  (مقام) |  ma*k*am |
| muṭla**q** |  (مطلق) |  mutla*k* |

***


**rh** menjadi *r*

|     |     |
| --- | --- |
| **rh**apsody |  *r*apsodi |
| **rh**ombus |  *r*ombus |
| **rh**ythm |  *r*itme |
| **rh**etoric |  *r*etorika |

***


**sin** (ﺱ Arab) menjadi *s*

|     |     |     |
| --- | --- | --- |
| a**s**ā**s** |  (أساس) |  a*s*a*s* |
| **s**alām |  (سلام) |  *s*alam |
| **s**il**s**ilah |  (سلسلة) |  *s*il*s*ilah |

**śa** (ﺙ Arab) menjadi *s*

|     |     |     |
| --- | --- | --- |
| a**ś**iri |  (أثيرى) |  a*s*iri |
| ḥadi**ś** |  (حديث) |  hadi*s* |
| **ś**ulā**ś**ā̒ |  (الثلاثاء) |  *s*ela*s*a |
| wāri**ś** |  (وارث) |  wari*s* |

**ṣad** (ﺹ Arab) menjadi *s*

|     |     |     |
| --- | --- | --- |
| ''a**ṣ**r |  (عصر) |  a*s*ar |
| mu**ṣ**ībah |  (مصيبة) |  mu*s*ibah |
| khu**ṣ**ū**ṣ** |  (خصوص) |  khu*s**u*s |
| **ṣ**aḥḥ |  (صح) |  sah |

**syin** (ﺵ Arab) menjadi *sy*

|     |     |     |
| --- | --- | --- |
| ''ā**sy**iq |  (عاشق) |  a*sy*ik |
| ''ar**sy** |  (عرش) |  ara*sy* |
| **sy**arṭ |  (شرط) |  sy arat |

**sc** di depan *a*, *o*, *u*, dan konsonan menjadi *sk*

|     |     |
| --- | --- |
| **sc**andium |  *sk*andium |
| **sc**otopia |  *sk*otopia |
| **sc**utella |  *sk*utela |
| **sc**lerosis |  *sk*lerosis |

**sc** di depan *e*, *i*, dan *y* menjadi *s*

|     |     |
| --- | --- |
| **sc**enography |  *s*enografi |
| **sc**intillation |  *s*intilasi |
| **sc**yphistoma |  *s*ifistoma |

**sch** di depan vokal menjadi *sk*

|     |     |
| --- | --- |
| **sch**ema |  *sk*ema |
| **sch**izophrenia |  *sk*izofrenia |
| **sch**olastic |  *sk*olastik |

***


**t** di depan *i* menjadi *s* jika lafalnya *s*

|     |     |
| --- | --- |
| ac**t**ie |  ak*s*i |
| ra**t**io |  ra*s*io |
| pa**t**ient |  pa*s*ien |

**ṭa** (ﻁ Arab) menjadi *t*

|     |     |     |
| --- | --- | --- |
| kha**ṭṭ** |  (خط) |  kha*t* |
| mu**ṭ**laq |  (مطلق) |  mu*t*lak |
| **ṭ**abīb |  (طبيب) |  *t*abib |

**th** menjadi *t*

|     |     |
| --- | --- |
| **th**eocracy |  *t*eokrasi |
| or**th**ography |  or*t*ografi |
| **th**rombosis |  *t*rombosis |
| me**th**ode (Belanda) |  me*t*ode |

***


**u** tetap *u*

|     |     |
| --- | --- |
| **u**nit |  *u*nit |
| n**u**cleolus |  n*u*kleolus |
| str**u**ct**u**re |  str*u*kt*u*r |
| instit**u**te |  instit*u*t |

**u** (Arab, bunyi pendek atau bunyi panjang) menjadi *u*

|     |     |     |
| --- | --- | --- |
| r**u**k**ū**'' |  (ركوع) |  r*u*k*u*k |
| sy**u**bḥāt |  (شبهات) |  sy*u*bhat |
| s**u**j**ū**d |  (سجود) |  s*u*j*u*d |
| ''**u**f**u**q |  (أفق) |  *u*f*u*k |

**ua** tetap *ua*

|     |     |
| --- | --- |
| aq**ua**rium |  ak*ua*rium |
| d**ua**lisme |  d*ua*lisme |
| sq**ua**dron |  sk*ua*dron |

**ue** tetap *ue*

|     |     |
| --- | --- |
| conseq**ue**nt |  konsek*ue*n |
| d**ue**t |  d*ue*t |
| s**ue**de |  s*ue*d |

**ui** tetap *ui*

|     |     |
| --- | --- |
| cond**ui**te |  kond*ui*te |
| eq**ui**nox |  ek*ui*noks |
| eq**ui**valent |  ek*ui*valen |

**uo** tetap *uo*

|     |     |
| --- | --- |
| fl**uo**rescein |  fl*uo*resein |
| q**uo**rum |  k*uo*rum |
| q**uo**ta |  k*uo*ta |

**uu** menjadi *u*

|     |     |
| --- | --- |
| lect**uu**r |  lekt*u*r |
| premat**uu**r |  premat*u*r |
| vac**uu**m |  vak*u*m |

***


**v** tetap *v*

|     |     |
| --- | --- |
| e**v**acuation |  e*v*akuasi |
| tele**v**ision |  tele*v*isi |
| **v**itamin |  *v*itamin |

***


**wau** (ﻭ Arab) tetap *w*

|     |     |     |
| --- | --- | --- |
| jad**w**al |  (جدول) |  jad*w*al |
| taq**w**ā |  (تقوى) |  tak*w*a |
| **w**ujū*d* |  (وجود) |  *w*ujud |

**wau** (ﻭ Arab, baik satu maupun dua konsonan) yang didahului *u* dihilangkan

|     |     |     |
| --- | --- | --- |
| nah**w**u |  (نحو) |  nah*u* |
| nubu**ww**ah |  (نبوة) |  nub*u*at |
| qu**ww**ah |  (قوة) |  k*u*at |

**aw** (diftong Arab) menjadi *au*, termasuk yang diikuti konsonan

|     |     |     |
| --- | --- | --- |
| **aw**rāt |  (عورة) |  *au*rat |
| h**aw**l |  (هول) |  h*au*l |
| m**aw**lid |  (مولد) |  m*au*lid |
| wal**aw** |  (ولو) |  wal*au* |

***


**x** pada awal kata tetap *x*

|     |     |
| --- | --- |
| **x**anthate |  *x*antat |
| **x**enon |  *x*enon |
| **x**ylophone |  *x*ilofon |

**x** pada posisi lain menjadi *ks*

|     |     |
| --- | --- |
| e**x**ecutive |  e*ks*ekutif |
| e**x**press |  e*ks*pres |
| late**x** |  late*ks* |
| ta**x**i |  ta*ks*i |

**xc** di depan *e* dan *i* menjadi *ks*

|     |     |
| --- | --- |
| e**xc**eption |  e*ks*epsi |
| e**xc**ess |  e*ks*es |
| e**xc**ision |  e*ks*isi |
| e**xc**itation |  e*ks*itasi |

**xc** di depan *a*, *o*, *u*, dan konsonan menjadi *ksk*

|     |     |
| --- | --- |
| e**xc**avation |  e*ksk*avasi |
| e**xc**ommunication |  e*ksk*omunikasi |
| e**xc**ursive |  e*ksk*ursif |
| e**xc**lusive |  e*ksk*lusif |

***


**y** tetap *y* jika lafalnya *y*

|     |     |
| --- | --- |
| **y**akitori |  *y*akitori |
| **y**angonin |  *y*angonin |
| **y**en |  *y*en |
| **y**uan |  *y*uan |

**y** menjadi *i* jika lafalnya *ai* atau *i*

|     |     |
| --- | --- |
| d**y**namo |  d*i*namo |
| prop**y**l |  prop*i*l |
| ps**y**cholog**y** |  ps*i*kolog*i* |
| **y**ttrium |  *i*trium |

**ya** (ﻱ Arab) di awal suku kata menjadi *y*

|     |     |     |
| --- | --- | --- |
| ''inā**y**ah |  (عناية) |  ina*y*ah |
| **y**aqīn |  (يقين) |  *y*akin |
| **y**a''nī |  (يعني) |  *y*akni |

**ya** (ﻱ Arab) di depan *i* dihilangkan

|     |     |     |
| --- | --- | --- |
| khi**y**ānah |  (خيانة) |  kh*i*anat |
| qi**y**ās |  (قياس) |  k*i*as |
| zi**y**ārah |  (زيارة) |  z*i*arah |

***


**z** tetap *z*

|     |     |
| --- | --- |
| **z**enith |  *z*enit |
| **z**irconium |  *z*irkonium |
| **z**odiac |  *z*odiak |
| **z**ygote |  *z*igot |

**zai** (ﺯ Arab) tetap *z*

|     |     |     |
| --- | --- | --- |
| ijā**z**ah |  (إجازة) |  ija*z*ah |
| kha**z**ānah |  (خزانة) |  kha*z*anah |
| **z**iyārah |  (زيارة) |  *z*iarah |
| **z**aman |  (زمن)

**żal** (ﺫ Arab) menjadi *z*

|     |     |     |
| --- | --- | --- |
| a**ż**ān |  (أذان) |  a*z*an |
| i*ż*n |  (إذن) |  i*z*in |
| ustā**ż** |  (أستاذ) |  usta*z* |
| **ż**āt |  (ذات) |  *z*at |

**ẓa** (ﻅ Arab) menjadi *z*

|     |     |     |
| --- | --- | --- |
| ḥāfi**ẓ** |  (حافظ) |  hafi*z* |
| ta''**ẓ**īm |  (تعظيم) |  tak*z*im |
| **ẓ**ālim |  (ظالم) |  *z*alim |

***


Konsonan ganda diserap menjadi konsonan tunggal, kecuali kalau dapat membingungkan.

Misalnya:

|     |     |
| --- | --- |
| a**cc**u |  a*k*i |
| ''a**ll**āmah |  a*l*amah |
| co**mm**i**ss**ion |  ko*m*i*s*i |
| e**ff**ect |  e*f*ek |
| fe**rr**um |  fe*r*um |
| ga**bb**ro |  ga*b*ro |
| ka**ff**ah |  ka*f*ah |
| salfe**gg**io |  salfe*g*io |
| tafa**kk**ur |  tafa*k*ur |
| ta**mm**at |  ta*m*at |
| ʼu**mm**at |  u*m*at |

**Perhatikan** penyerapan berikut!

|     |     |
| --- | --- |
| ʼA**ll**ah |  A*ll*ah |
| ma**ss** |  ma*ss*a |
| ma**ss**al |  ma*ss*al |
Catatan

Unsur serapan yang sudah lazim dieja sesuai dengan ejaan bahasa Indonesia tidak perlu lagi diubah.

Misalnya:

|     |     |     |
| --- | --- | --- |
| bengkel |  nalar |  Rabu |
| dongkrak |  napas |  Selasa |
| faedah |  paham |  Senin |
| kabar |  perlu |  sirsak |
| khotbah |  pikir |  soal |
| koperasi |  populer |  telepon |
| lahir |   | |

***


Selain kaidah penulisan unsur serapan di atas, berikut ini dis-ertakan daftar istilah asing yang mengandung akhiran serta penyesuaiannya secara utuh dalam bahasa Indonesia.

***

**-aat** (Belanda) menjadi *-at*

**-age** menjadi *-ase*

|     |     |
| --- | --- |
| percent**age** |  persent*ase* |
| etal**age** |  etal*ase* |

**-ah** (Arab) menjadi *-ah* atau *-at*

|     |     |     |
| --- | --- | --- |
| ''aqīd**ah** |  (عقيدة) |  akid*ah* |
| ʼijāz**ah** |  (إجازة) |  ijaz*ah* |
| ''umr**ah** |  (عمرة) |  umr*ah* |
| ʼākhir**ah** |  (آخرة) |  akhir*at* |
| ʼāy**ah** |  (أية) |  ay*at* |
| ma''siyy**ah** |  (معصية) |  maksi*at* |
| ʼamān**ah** |  (أمانة) |  aman*ah*, aman*at* |
| hikm**ah** |  (حكمة) |  hikm*ah*, hikm*at* |
| ''ibād**ah** |  (عبادة) |  ibad*ah*, ibad*at* |
| sunn**ah** |  (سنة) |  sun*ah*, sun*at* |
| sūr**ah** |  (سورة) |  sur*ah*, sur*at* |

**-al** (Inggris), **-eel** dan **-aal** (Belanda) menjadi *-al*

|     |     |
| --- | --- |
| structur**al**, structur**eel** |  struktur*al* |
| form**al**, form**eel** |  form*al* |
| norm**al**, norm**aal** |  norm*al* |

**-ant** menjadi *-an*

|     |     |
| --- | --- |
| account**ant** |  akunt*an* |
| consult**ant** |  konsult*an* |
| inform**ant** |  inform*an* |

**-archy** (Inggris), **-archie** (Belanda) menjadi *arki*

|     |     |
| --- | --- |
| an**archy**, a**archie** |  anar*ki* |
| mon**archy**, mon**archie** |  monar*ki* |
| olig**archy**, olig**archie** |  oligar*ki* |

**-ary** (Inggris), **-air** (Belanda) menjadi *-er*

|     |     |
| --- | --- |
| complement**ary**, complement**air** |  komplement*er* |
| prim**ary**, prim**air** |  prim*er* |
| second**ary**, secund**air** |  sekund*er* |

**-(a)tion** (Inggris), **-(a)tie** (Belanda) menjadi *-asi*, *-si*

|     |     |
| --- | --- |
| ac**tion**, ac**tie** |  ak*si* |
| public**ation**, public**atie** |  publika*si* |

***

**-eel** (Belanda) menjadi *-el*

|     |     |
| --- | --- |
| materi**eel** |  materi*el* |
| mor**eel** |  mor*el* |

**-ein** tetap *-ein*

|     |     |
| --- | --- |
| cas**ein** |  kas*ein* |
| prot**ein** |  prot*ein* |

***

**-i**, **-iyyah** (akhiran Arab) menjadi *-i* atau *-iah*

|     |     |     |
| --- | --- | --- |
| ''ālam**ī** |  (عالمي) |  alam*i* |
| ʼinsān**ī** |  (إنساني) |  insan*i* |
| ''āl**iyyah** |  (عالية) |  al*iah* |
| ''amal**iyyah** |  (عملية) |  amal*iah* |

**-ic**, **-ics**, dan **-ique** (Inggris), **-iek** dan **-ica** (Belanda) menjadi *-ik*, *ika*

|     |     |
| --- | --- |
| dialect**ics**, dialekt**ica** |  dialekt*ika* |
| log**ic**, log**ica** |  log*ika* |
| phys**ics**, phys**ica** |  fis*ika* |
| linguist**ics**, linguist**iek** |  linguist*ik* |
| phonet**ics**, phonet**iek** |  fonet*ik* |
| techn**ique**, techn**iek** |  tekn*ik* |

**-ic** (Inggris), **-isch** (adjektiva Belanda) menjadi *-ik*

|     |     |
| --- | --- |
| electron**ic**, elektron**isch** |  elektron*ik* |
| mechan**ic**, mechan**isch** |  mekan*ik* |
| ballist**ic**, ballist**isch** |  balist*ik* |

**-ical** (Inggris), **-isch** (Belanda) menjadi *-is*

|     |     |
| --- | --- |
| econom**ical**, econom**isch** |  ekonom*is* |
| pract**ical**, pract**isch** |  prakt*is* |
| log**ical**, log**isch** |  log*is* |

**-ile** (Inggris), **-iel** (Belanda) menjadi *-il*

|     |     |
| --- | --- |
| mob**ile**, mob**iel** |  mob*il* |
| percent**ile**, percent**iel** |  persent*il* |
| project**ile**, project**iel** |  proyekt*il* |

**-ism** (Inggris), **-isme** (Belanda) menjadi *-isme*

|     |     |
| --- | --- |
| capital**ism**, capital**isme** |  kapital*isme* |
| commun**ism**, commun**isme** |  komun*isme* |
| modern**ism**, modern**isme** |  modern*isme* |

**-ist** menjadi *-is*

|     |     |
| --- | --- |
| ego**ist** |  ego*is* |
| hedon**ist** |  hedonis |
| public**ist** |  publis*is* |

**-ive** (Inggris), **-ief** (Belanda) menjadi *-if*

|     |     |
| --- | --- |
| communicat**ive**, communicat**ief** |  komunikat*if* |
| demonstrat**ive**, demonstrat**ief** |  demonstrat*if* |
| descript**ive**, descript**ief** |  deskript*if* |

***

**-logue** (Inggris), **-loog** (Belanda) menjadi *-log*

|     |     |
| --- | --- |
| ana**logue**, ana**loog** |  ana*log* |
| epi**logue**, epi**loog** |  epi*log* |
| pro**logue**, pro**loog** |  pro*log* |

**-logy** (Inggris), **-logie** (Belanda) menjadi *-logi*

|     |     |
| --- | --- |
| techno**logy**, techno**logie** |  tekno*logi* |
| physi**ology**, physio**logie** |  fisio*logi* |
| ana**logy**, ana**logie** |  ana*logi* |

***

**-oid** (Inggris), **-oide** (Belanda) menjadi *-oid*

|     |     |
| --- | --- |
| anthrop**oid**, anthrop**oide** |  antrop*oid* |
| homin**oid**, homin**oide** |  homin*oid* |

**-oir**(e) menjadi *-oar*

|     |     |
| --- | --- |
| trot**oir** |  trot*oar* |
| repert**oire** |  repert*oar* |

**-or** (Inggris), **-eur** (Belanda) menjadi *-ur*, *-ir*

|     |     |
| --- | --- |
| direct**or**, direct**eur** |  direkt*ur* |
| inspect**or**, inspect**eur** |  inspekt*ur* |
| amat**eur** |  amat*ir* |
| format**eur** |  format*ur* |

**-or** tetap *-or*

|     |     |
| --- | --- |
| dictat**or** |  diktat*or* |
| correct**or** |  korekt*or* |
| distributor |  distribut*or* |

***

**-ty** (Inggris), **-teit** (Belanda) menjadi *-tas*

|     |     |
| --- | --- |
| universi**ty**, universi**teit** |  universi*tas* |
| quali**ty**, kwali**teit** |  kuali*tas* |
| quanti**ty**, kwanti**teit** |  kuanti*tas* |

***

**-ure** (Inggris), **-uur** (Belanda) menjadi *-ur*

|     |     |
| --- | --- |
| cult**ure**, cult**uur** |  kult*ur* |
| premat**ure**, prema**tuur** |  premat*ur* |
| struct**ure**, strukt**uur** |  strukt*ur* |

***

**-wi**, **-wiyyah** (Arab) menjadi *-wi*, *-wiah*

|     |     |     |
| --- | --- | --- |
| dunyā**wī** |  (دنيوية) |  dunia*wi* |
| kimiyā**wī** |  (كيمياوي) |  kimia*wi* |
| lugawi**yyah** |  (لغوية) |  luga*wiah* |');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('kata-ganti', 'J. Kata Ganti', 'kata/kata-ganti.md', '# J. Kata Ganti

!!! important ""
	Kata ganti *ku-* dan *kau-* ditulis serangkai dengan kata yang mengikutinya, sedangkan *-ku*, *-mu*, dan *-nya* ditulis serangkai dengan kata yang mendahuluinya.

Misalnya:

- Rumah itu telah *ku*jual.
- Majalah ini boleh *kau*baca.
- Buku*ku*, buku*mu*, dan buku*nya* tersimpan di perpustakaan.
- Rumah*nya* sedang diperbaiki.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('kata-depan', 'F. Kata Depan', 'kata/kata-depan.md', '# F. Kata Depan

!!! important ""
	Kata depan, seperti *di*, *ke*, dan *dari*, ditulis terpisah dari kata yang mengikutinya.

Misalnya:

- *Di* mana dia sekarang?
- Kain itu disimpan *di* dalam lemari.
- Dia ikut terjun *ke* tengah kancah perjuangan.
- Mari kita berangkat *ke* kantor.
- Saya pergi *ke* sana mencarinya.
- Ia berasal *dari* Pulau Penyengat.
- Cincin itu terbuat *dari* emas.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('singkatan-dan-akronim', 'H. Singkatan dan Akronim', 'kata/singkatan-dan-akronim.md', '# H. Singkatan dan Akronim

!!! important ""
	**II.H.1** Singkatan nama orang, gelar, sapaan, jabatan, atau pangkat diikuti dengan tanda titik pada setiap unsur singkatan itu.

Misalnya:

- A.H. Nasution = Abdul Haris Nasution
- H. Hamid = Haji Hamid
- Suman Hs. = Suman Hasibuan
- W.R. Supratman = Wage Rudolf Supratman
- M.B.A. = master of business administration
- M.Hum. = magister humaniora
- M.Si. = magister sains
- S.E. = sarjana ekonomi
- S.Sos. = sarjana sosial
- S.Kom. = sarjana komunikasi
- S.K.M. = sarjana kesehatan masyarakat
- Sdr. = saudara
- Kol. Darmawati = Kolonel Darmawati

!!! important ""
	**II.H.2.a** Singkatan yang terdiri atas huruf awal setiap kata nama lembaga pemerintah dan ketatanegaraan, lembaga pendidikan, badan atau organisasi, serta nama dokumen resmi ditulis dengan huruf kapital tanpa tanda titik.

Misalnya:

- NKRI = Negara Kesatuan Republik Indonesia
- UI = Universitas Indonesia
- PBB = Perserikatan Bangsa-Bangsa
- WHO = World Health Organization
- PGRI = Persatuan Guru Republik Indonesia
- KUHP = Kitab Undang-Undang Hukum Pidana

!!! important ""
	**II.H.2.b** Singkatan yang terdiri atas huruf awal setiap kata yang bukan nama diri ditulis dengan huruf kapital tanpa tanda titik.

Misalnya:

- PT = perseroan terbatas
- MAN = madrasah aliah negeri
- SD = sekolah dasar
- KTP = kartu tanda penduduk
- SIM = surat izin mengemudi
- NIP = nomor induk pegawai

!!! important ""
	**II.H.3** Singkatan yang terdiri atas tiga huruf atau lebih diikuti dengan tanda titik.

Misalnya:

- hlm. = halaman
- dll. = dan lain-lain
- dsb. = dan sebagainya
- dst. = dan seterusnya
- sda. = sama dengan di atas
- ybs. = yang bersangkutan
- yth. = yang terhormat
- ttd. = tertanda
- dkk. = dan kawan-kawan

!!! important ""
	**II.H.4** Singkatan yang terdiri atas dua huruf yang lazim dipakai dalam surat-menyurat masing-masing diikuti oleh tanda titik.

Misalnya:

- a.n. = atas nama
- d.a. = dengan alamat
- u.b. = untuk beliau
- u.p. = untuk perhatian
- s.d. = sampai dengan

!!! important ""
	**II.H.5** Lambang kimia, singkatan satuan ukuran, takaran, timbangan, dan mata uang tidak diikuti tanda titik.

Misalnya:

- Cu = kuprum
- cm = sentimeter
- kVA = kilovolt-ampere
- l = liter
- kg = kilogram
- Rp = rupiah

!!! important ""
	**II.H.6** Akronim nama diri yang terdiri atas huruf awal setiap kata ditulis dengan huruf kapital tanpa tanda titik.

Misalnya:

- BIG = Badan Informasi Geospasial
- BIN = Badan Intelijen Negara
- LIPI = Lembaga Ilmu Pengetahuan Indonesia
- LAN = Lembaga Administrasi Negara
- PASI = Persatuan Atletik Seluruh Indonesia

!!! important ""
	**II.H.7** Akronim nama diri yang berupa gabungan suku kata atau gabungan huruf dan suku kata dari deret kata ditulis dengan huruf awal kapital.

Misalnya:

- Bulog = Badan Urusan Logistik
- Bappenas = Badan Perencanaan Pembangunan Nasional
- Kowani = Kongres Wanita Indonesia
- Kalteng = Kalimantan Tengah
- Mabbim = Majelis Bahasa Brunei Darussalam-Indonesia-Malaysia
- Suramadu = Surabaya Madura

!!! important ""
	**II.H.8** Akronim bukan nama diri yang berupa gabungan huruf awal dan suku kata atau gabungan suku kata ditulis dengan huruf kecil.

Misalnya:

- iptek = ilmu pengetahuan dan teknologi
- pemilu = pemilihan umum
- puskesmas = pusat kesehatan masyarakat
- rapim = rapat pimpinan
- rudal = peluru kendali
- tilang = bukti pelanggaran');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('bentuk-ulang', 'C. Bentuk Ulang', 'kata/bentuk-ulang.md', '# C. Bentuk Ulang

!!! important ""
	Bentuk ulang ditulis dengan menggunakan tanda hubung (-) di antara unsur-unsurnya.

Misalnya:

- anak-anak
- biri-biri
- lauk-pauk
- berjalan-jalan
- buku-buku
- cumi-cumi
- mondar-mandir
- mencari-cari
- hati-hati
- kupu-kupu
- ramah-tamah
- terus-menerus
- kuda-kuda
- kura-kura
- sayur-mayur
- porak-poranda
- mata-mata
- ubun-ubun
- serba-serbi
- tunggang-langgang

Catatan: Bentuk ulang [gabungan kata](gabungan-kata) ditulis dengan mengulang unsur pertama.

Misalnya:

- surat kabar → surat-surat kabar
- kapal barang → kapal-kapal barang
- rak buku → rak-rak buku
- kereta api cepat → kereta-kereta api cepat

!!! note "Catatan"
	Bila bentuk ulang diberi [huruf kapital](../huruf/huruf-kapital), misalnya pada nama diri (nama lembaga, dokumen, dll.) atau judul (buku, majalah, dll.), bentuk ulang sempurna diberi huruf kapital pada huruf pertama tiap unsurnya, sedangkan bentuk ulang lain hanya diberi huruf kapital pada huruf pertama unsur pertamanya. Misalnya:
	
	- Ia menyajikan makalah "Penerapan *A*sas-*A*sas Hukum Perdata".
	- Slogan "*T*erus-*m*enerus *R*amah-*t*amah" dikampanyekan gubernur baru itu.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('pemenggalan-kata', 'E. Pemenggalan Kata', 'kata/pemenggalan-kata.md', '# E. Pemenggalan Kata

!!! important ""
	**II.E.1** Pemenggalan kata pada kata dasar dilakukan sebagai berikut.

a. Jika di tengah kata terdapat [huruf vokal](../huruf/huruf-vokal) yang berurutan, pemenggalannya dilakukan di antara kedua huruf vokal itu.

Misalnya:

- bu-ah
- ma-in
- ni-at
- sa-at

b. [Huruf diftong](../huruf/huruf-diftong) *ai*, *au*, *ei*, dan *oi* tidak dipenggal.

Misalnya:

- pan-dai
- au-la
- sau-da-ra
- sur-vei
- am-boi

c. Jika di tengah kata dasar terdapat [huruf konsonan](../huruf/huruf-konsonan) (termasuk [gabungan huruf konsonan](../huruf/gabungan-huruf-konsonan)) di antara dua huruf vokal, pemenggalannya dilakukan sebelum huruf konsonan itu.

Misalnya:

- ba-pak
- la-wan
- de-ngan
- ke-nyang
- mu-ta-khir
- mu-sya-wa-rah

d. Jika di tengah kata dasar terdapat dua huruf konsonan yang berurutan, pemenggalannya dilakukan di antara kedua huruf konsonan itu.

Misalnya:

- Ap-ril
- cap-lok
- makh-luk
- man-di
- sang-gup
- som-bong
- swas-ta

e. Jika di tengah kata dasar terdapat tiga huruf konsonan atau lebih yang masing- masing melambangkan satu bunyi, pemenggalannya dilakukan di antara huruf konsonan yang pertama dan huruf konsonan yang kedua.

Misalnya:

- ul-tra
- in-fra
- ben-trok
- in-stru-men

Catatan: Gabungan huruf konsonan yang melambangkan satu bunyi tidak dipenggal.

Misalnya:

- bang-krut
- bang-sa
- ba-nyak
- ikh-las
- kong-res
- makh-luk
- masy-hur
- sang-gup

!!! important ""
	**II.E.2** Pemenggalan [kata turunan](../kata/kata-berimbuhan) sedapat-dapatnya dilakukan di antara bentuk dasar dan unsur pembentuknya.

Misalnya:

- *ber*-jalan
- *mem*-pertanggungjawab*kan*
- *mem*-bantu
- *memper*-tanggungjawab*kan*
- *di*-ambil
- *memper*tanggung-jawab*kan*
- *ter*-bawa
- *memper*tanggungjawab-*kan*
- *per*-buat
- *me*-rasakan
- makan-*an*
- *me*rasa-*kan*
- letak-*kan*
- *per*-buat*an*
- pergi-*lah*
- *per*buat-*an*
- apa-*kah*
- *ke*-kuat*an*
- *ke*kuat-*an*

Catatan:

(1) Pemenggalan kata berimbuhan yang bentuk dasarnya mengalami perubahan dilakukan seperti pada kata dasar.

Misalnya:

- *me*-*nu*-tup
- *me*-*ma*-kai
- *me*-*nya*-pu
- *me*-*nge*-cat
- *pe*-*mi*-kir
- *pe*-*no*-long
- *pe*-*nga*-rang
- *pe*-*nge*-tik
- *pe*-*nye*-but

(2) Pemenggalan kata bersisipan dilakukan seperti pada kata dasar.

Misalnya:

- ge-lem-bung
- ge-mu-ruh
- ge-ri-gi
- si-nam-bung
- te-lun-juk

(3) Pemenggalan kata yang menyebabkan munculnya satu huruf di awal atau akhir baris *tidak* dilakukan.

Misalnya:

- Beberapa pendapat mengenai masalah itu  
telah disampaikan ....
- Walaupun cuma-cuma, mereka tidak mau  
mengambil makanan itu.

!!! important ""
	**II.E.3** Jika sebuah kata terdiri atas dua unsur atau lebih dan salah satu unsurnya itu dapat bergabung dengan unsur lain, pemenggalannya dilakukan di antara unsur-unsur itu. Tiap unsur gabungan itu dipenggal seperti pada kata dasar.

Misalnya:

- biografi, bio-grafi, bi-o-gra-fi
- biodata, bio-data, bi-o-da-ta
- fotografi, foto-grafi, fo-to-gra-fi
- fotokopi, foto-kopi, fo-to-ko-pi
- introspeksi, intro-speksi, in-tro-spek-si
- introjeksi, intro-jeksi, in-tro-jek-si
- kilogram, kilo-gram, ki-lo-gram
- kilometer, kilo-meter, ki-lo-me-ter
- pascapanen, pasca-panen, pas-ca-pa-nen
- pascasarjana, pasca-sarjana, pas-ca-sar-ja-na

!!! important ""
	**II.E.4** Nama orang yang terdiri atas dua unsur atau lebih pada akhir baris dipenggal di antara unsur-unsurnya.

Misalnya:

- Lagu "Indonesia Raya" digubah oleh Wage Rudolf  
Supratman.
- Buku *Layar Terkembang* dikarang oleh Sutan Takdir  
Alisjahbana.

!!! important ""
	**II.E.5** Singkatan nama diri dan gelar yang terdiri atas dua huruf atau lebih tidak dipenggal.

Misalnya:

Ia bekerja di DLLAJR.
Pujangga terakhir Keraton Surakarta bergelar R.Ng. Rangga Warsita.

Catatan: Penulisan berikut dihindari.

- Ia bekerja di DLL-  
AJR.
- Pujangga terakhir Keraton Surakarta bergelar R.  
Ng. Rangga Warsita.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('kata-berimbuhan', 'B. Kata Berimbuhan', 'kata/kata-berimbuhan.md', '# B. Kata Berimbuhan

!!! important ""
	**II.B.1** Imbuhan (awalan, sisipan, akhiran, serta gabungan awalan dan akhiran) ditulis serangkai dengan bentuk dasarnya.

Misalnya:

- *ber*jalan
- *ber*kelanjutan
- *memper*mudah
- g*em*etar
- lukis*an*
- *ke*mau*an*
- *per*baik*an*

Catatan:
Imbuhan yang diserap dari unsur asing, seperti *-isme*, *-man*, *-wan*, atau *-wi*, ditulis serangkai dengan bentuk dasarnya.

Misalnya:

- suku*isme*
- seni*man*
- kamera*wan*
- gereja*wi*

!!! important ""
	**II.B.2** Bentuk terikat ditulis serangkai dengan kata yang mengikutinya.

Misalnya:

- *adi*busana
- *aero*dinamika
- *antar*kota
- *anti*biotik
- *awa*hama
- *bi*karbonat
- *bio*kimia
- *deka*meter
- *de*moralisasi
- *dwi*warna
- *eka*bahasa
- *ekstra*kurikuler
- *infra*struktur
- *in*konvensional
- *kontra*indikasi
- *ko*sponsor
- *manca*negara
- *multi*lateral
- *nara*pidana
- *non*kolaborasi
- *pari*purna
- *pasca*sarjana
- *pramu*saji
- *pra*sejarah
- *pro*aktif
- *purna*wirawan
- *sapta*krida
- *semi*profesional
- *sub*bagian
- *swa*daya
- *tele*wicara
- *trans*migrasi
- *tuna*karya
- *tri*tunggal
- *tan*suara
- *ultra*modern

Catatan:

(1) Bentuk terikat yang diikuti oleh kata yang berhuruf awal kapital atau singkatan yang berupa huruf kapital dirangkaikan dengan [tanda hubung](../tanda-baca/tanda-hubung) (-).

Misalnya:

- *non*-Indonesia
- *pan*-Afrikanisme
- *pro*-Barat
- *non*-ASEAN
- *anti*-PKI

(2) Bentuk *maha* yang diikuti kata turunan yang mengacu pada nama atau sifat Tuhan ditulis terpisah dengan huruf awal kapital.

Misalnya:

- Marilah kita bersyukur kepada Tuhan Yang *Maha* Pengasih.
- Kita berdoa kepada Tuhan Yang *Maha* Pengampun.

(3) Bentuk *maha* yang diikuti kata dasar yang mengacu kepada nama atau sifat Tuhan, kecuali kata *esa*, ditulis serangkai.

Misalnya:

- Tuhan Yang *Mahakuasa* menentukan arah hidup kita.
- Mudah-mudahan Tuhan Yang *Maha Esa* melindungi kita.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('kata-sandang', 'K. Kata Sandang', 'kata/kata-sandang.md', '# K. Kata Sandang

!!! important ""
	Kata *si* dan *sang* ditulis terpisah dari kata yang mengikutinya.

Misalnya:

- Surat itu dikembalikan kepada *si* pengirim.
- Toko itu memberikan hadiah kepada *si* pembeli.
- Ibu itu menghadiahi *sang* suami kemeja batik.
- Sang adik mematuhi nasihat *sang* kakak.
- Harimau itu marah sekali kepada *sang* Kancil.
- Dalam cerita itu *si* Buta berhasil menolong kekasihnya.

Catatan: Huruf awal *sang* ditulis dengan huruf kapital jika *sang* merupakan unsur nama Tuhan.

Misalnya:

- Kita harus berserah diri kepada *Sang* Pencipta.
- Pura dibangun oleh umat Hindu untuk memuja *Sang* Hyang Widhi Wasa.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('index', 'II. Penulisan Kata', 'kata/index.md', '# II. Penulisan Kata

A. [Kata Dasar](kata-dasar.md)  
B. [Kata Berimbuhan](kata-berimbuhan.md)  
C. [Bentuk Ulang](bentuk-ulang.md)  
D. [Gabungan Kata](gabungan-kata.md)  
E. [Pemenggalan Kata](pemenggalan-kata.md)  
F. [Kata Depan](kata-depan.md)  
G. [Partikel](partikel.md)  
H. [Singkatan dan Akronim](singkatan-dan-akronim.md)  
I. [Angka dan Bilangan](angka-dan-bilangan.md)  
J. [Kata Ganti](kata-ganti.md)  
K. [Kata Sandang](kata-sandang.md)');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('kata-dasar', 'A. Kata Dasar', 'kata/kata-dasar.md', '# A. Kata Dasar

!!! important ""
	Kata dasar ditulis sebagai satu kesatuan.

Misalnya:

- Kantor pajak penuh sesak.
- Saya pergi ke sekolah.
- Buku itu sangat tebal.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('gabungan-kata', 'D. Gabungan Kata', 'kata/gabungan-kata.md', '# D. Gabungan Kata

!!! important ""
	**II.D.1** Unsur gabungan kata yang lazim disebut kata majemuk, termasuk istilah khusus, ditulis terpisah.

Misalnya:

- duta besar 
- model linear
- kambing hitam 
- persegi panjang
- orang tua 
- rumah sakit jiwa
- simpang empat 
- meja tulis
- mata acara 
- cendera mata

!!! important ""
	**II.D.2** Gabungan kata yang dapat menimbulkan salah pengertian ditulis dengan membubuhkan tanda hubung (-) di antara unsur-unsurnya.

Misalnya:

- *anak-istri* pejabat (anak dan istri dari pejabat)
- anak *istri-pejabat* (anak dari istri pejabat)
- *ibu-bapak* kami (ibu dan bapak kami)
- ibu *bapak-kami* (ibu dari bapak kami)
- *buku-sejarah* baru (buku sejarah yang baru)
- buku *sejarah-baru* (buku tentang sejarah baru)

!!! important ""
	**II.D.3** Gabungan kata yang penulisannya terpisah tetap ditulis terpisah jika mendapat awalan atau akhiran.

Misalnya:

- *ber*tepuk tangan
- *meng*anak sungai
- garis bawah*i*
- sebar luas*kan*

!!! important ""
	**II.D.4** Gabungan kata yang mendapat awalan dan akhiran sekaligus ditulis serangkai.

Misalnya:

- *di*lipatganda*kan*
- *meng*garisbawah*i*
- *meny*ebarluas*kan*
- *peng*hancurlebur*an*
- *per*tanggungjawab*an*

!!! important ""
	**II.D.5** Gabungan kata yang sudah padu ditulis serangkai.

Misalnya:

- acapkali
- adakalanya
- apalagi
- bagaimana
- barangkali
- beasiswa
- belasungkawa
- bilamana
- bumiputra
- darmabakti
- dukacita
- hulubalang
- kacamata
- kasatmata
- kilometer
- manasuka
- matahari
- olahraga
- padahal
- peribahasa
- perilaku
- puspawarna
- radioaktif
- saptamarga
- saputangan
- saripati
- sediakala
- segitiga
- sukacita
- sukarela
- syahbandar
- wiraswasta');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('angka-dan-bilangan', 'I. Angka dan Bilangan', 'kata/angka-dan-bilangan.md', '# I. Angka dan Bilangan

Angka Arab atau angka Romawi lazim dipakai sebagai lambang bilangan atau nomor.

- Angka Arab: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
- Angka Romawi: I, II, III, IV, V, VI, VII, VIII, IX, X, L (50), C (100), D (500), M (1.000), V̄ (5.000), M̄ (1.000.000)

!!! important ""
	**II.I.1** Bilangan dalam teks yang dapat dinyatakan dengan satu atau dua kata ditulis dengan huruf, kecuali jika dipakai secara berurutan seperti dalam perincian.

Misalnya:

- Mereka menonton drama itu sampai *tiga* kali.
- Koleksi perpustakaan itu lebih dari *satu juta* buku.
- Di antara *72* anggota yang hadir, *52* orang setuju, *15* orang tidak setuju, dan *5* orang abstain.
- Kendaraan yang dipesan untuk angkutan umum terdiri atas *50* bus, *100* minibus, dan *250* sedan.

!!! important ""
	**II.I.2.a** Bilangan pada awal kalimat ditulis dengan huruf.

Misalnya:

- *Lima puluh* siswa teladan mendapat beasiswa dari pemerintah daerah.
- *Tiga* pemenang sayembara itu diundang ke Jakarta.

Catatan: Penulisan berikut *dihindari*:

- *50* siswa teladan mendapat beasiswa dari pemerintah daerah.
- *3* pemenang sayembara itu diundang ke Jakarta.

!!! important ""
	**II.I.2.b** Apabila bilangan pada awal kalimat tidak dapat dinyatakan dengan satu atau dua kata, susunan kalimatnya diubah.

Misalnya:

- Panitia mengundang *250* orang peserta.
- Di lemari itu tersimpan *25* naskah kuno.

Catatan: Penulisan berikut *dihindari*:

- *250* orang peserta diundang panitia.
- *25* naskah kuno tersimpan di lemari itu.

!!! important ""
	**II.I.3** Angka yang menunjukkan bilangan besar dapat ditulis sebagian dengan huruf supaya lebih mudah dibaca.

Misalnya:

- Dia mendapatkan bantuan *250 juta* rupiah untuk mengembangkan usahanya.
- Perusahaan itu baru saja mendapat pinjaman *550 miliar* rupiah.
- Proyek pemberdayaan ekonomi rakyat itu memerlukan biaya *Rp10 triliun*.

!!! important ""
	**II.I.4** Angka dipakai untuk menyatakan (a) ukuran panjang, berat, luas, isi, dan waktu serta (b) nilai uang.

Misalnya:

- 0,5 sentimeter
- 5 kilogram
- 4 hektare
- 10 liter
- 2 tahun 6 bulan 5 hari
- 1 jam 20 menit
- Rp5.000,00
- US$3,50
- £5,10
- ¥100

!!! important ""
	**II.I.5** Angka dipakai untuk menomori alamat, seperti jalan, rumah, apartemen, atau kamar.

Misalnya:

- Jalan Tanah Abang I No. 15 atau
- Jalan Tanah Abang I/15
- Jalan Wijaya No. 14
- Hotel Mahameru, Kamar 169
- Gedung Samudra, Lantai II, Ruang 201

!!! important ""
	**II.I.6** Angka dipakai untuk menomori bagian karangan atau ayat kitab suci.

Misalnya:

- Bab X, Pasal 5, halaman 252
- Surah Yasin: 9
- Markus 16: 15—16

!!! important ""
	**II.I.7** Penulisan bilangan dengan huruf dilakukan sebagai berikut.

a. Bilangan Utuh

Misalnya:

- dua belas (12)
- tiga puluh (30)
- lima ribu (5.000)

b. Bilangan Pecahan

Misalnya:

- setengah atau seperdua (1/2)
- seperenam belas (1/16)
- tiga perempat (3/4)
- dua persepuluh (2/10)
- tiga dua-pertiga (3 2/3)
- satu persen (1%)
- satu permil (1o/oo)

!!! important ""
	**II.I.8** Penulisan bilangan tingkat dapat dilakukan dengan cara berikut.

Misalnya:

- abad *XX*
- abad *ke-20*
- abad *kedua puluh*
- Perang Dunia *II*
- Perang Dunia *Ke-2*
- Perang Dunia *Kedua*

!!! important ""
	**II.I.9** Penulisan angka yang mendapat akhiran *-an* dilakukan dengan cara berikut.

Misalnya:

- lima lembar uang *1.000-an* (lima lembar uang *seribuan*)
- tahun *1950-an* (tahun *seribu sembilan ratus lima puluhan*)
- uang *5.000-an* (uang *lima ribuan*)

!!! important ""
	**II.I.10** Penulisan bilangan dengan angka dan huruf sekaligus dilakukan dalam peraturan perundang-undangan, akta, dan kuitansi.

Misalnya:

- Setiap orang yang menyebarkan atau mengedarkan rupiah tiruan, sebagaimana dimaksud dalam Pasal 23 ayat (2), dipidana dengan pidana kurungan paling lama *1 (satu)* tahun dan pidana denda paling banyak *Rp200.000.000,00 (dua ratus juta rupiah)*.
- Telah diterima uang sebanyak *Rp2.950.000,00 (dua juta sembilan ratus lima puluh ribu rupiah)* untuk pembayaran satu unit televisi.

!!! important ""
	**II.I.11** Penulisan bilangan yang dilambangkan dengan angka dan diikuti huruf dilakukan seperti berikut.

Misalnya:

- Saya lampirkan tanda terima uang sebesar *Rp900.500,50 (sembilan ratus ribu lima ratus rupiah lima puluh sen)*.
- Bukti pembelian barang seharga *Rp5.000.000,00 (lima juta rupiah)* ke atas harus dilampirkan pada laporan pertanggungjawaban.

!!! important ""
	**II.I.12** Bilangan yang digunakan sebagai unsur nama geografi ditulis dengan huruf.

Misalnya:

- Kelapa*dua*
- Kotonan*ampek*
- Raja*ampat*
- Simpang*lima*
- *Tiga*raksa');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('partikel', 'G. Partikel', 'kata/partikel.md', '# G. Partikel

!!! important ""
	**II.G.1** Partikel *-lah*, *-kah*, dan *-tah* ditulis serangkai dengan kata yang mendahuluinya.

Misalnya:

- Baca*lah* buku itu baik-baik!
- Apa*kah* yang tersirat dalam surat itu?
- Siapa*kah* gerangan dia?
- Apa*tah* gunanya bersedih hati?

!!! important ""
	**II.G.2** Partikel *pun* ditulis terpisah dari kata yang mendahuluinya.

Misalnya:

- Apa *pun* permasalahan yang muncul, dia dapat mengatasinya dengan bijaksana.
- Jika kita hendak pulang tengah malam *pun*, kendaraan masih tersedia.
- Jangankan dua kali, satu kali *pun* engkau belum pernah berkunjung ke rumahku.

Catatan: Partikel *pun* yang merupakan unsur kata penghubung ditulis serangkai.

Misalnya:

- *Meskipun* sibuk, dia dapat menyelesaikan tugas tepat pada waktunya.
- Dia tetap bersemangat *walaupun* lelah.
- *Adapun* penyebab kemacetan itu belum diketahui.
- *Bagaimanapun* pekerjaan itu harus selesai minggu depan.

!!! important ""
	**II.G.3** Partikel *per* yang berarti ''demi'', ''tiap'', atau ''mulai'' ditulis terpisah dari kata yang mengikutinya.

Misalnya:

- Mereka masuk ke dalam ruang rapat satu *per* satu.
- Harga kain itu Rp50.000,00 *per* meter.
- Karyawan itu mendapat kenaikan gaji *per* 1 Januari.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-petik', 'J. Tanda Petik ("…")', 'tanda-baca/tanda-petik.md', '# J. Tanda Petik ("…")

!!! important ""
	**III.J.1** Tanda petik dipakai untuk mengapit petikan langsung yang berasal dari pembicaraan, naskah, atau bahan tertulis lain.

Misalnya:

- "Merdeka atau mati!" seru Bung Tomo dalam pidatonya.
- "Kerjakan tugas ini sekarang!" perintah atasannya. "Besok akan dibahas dalam rapat."
- Menurut Pasal 31 Undang-Undang Dasar Negara Republik Indonesia Tahun 1945, "Setiap warga negara berhak memperoleh pendidikan."

!!! important ""
	**III.J.2** Tanda petik dipakai untuk mengapit judul sajak, lagu, film, sinetron, artikel, naskah, atau bab buku yang dipakai dalam kalimat.

Misalnya:

- Sajak "Pahlawanku" terdapat pada halaman 125 buku itu.
- Marilah kita menyanyikan lagu "Maju Tak Gentar"!
- Film "Ainun dan Habibie" merupakan kisah nyata yang diangkat dari sebuah novel.
- Saya sedang membaca "Peningkatan Mutu Daya Ungkap Bahasa Indonesia" dalam buku *Bahasa Indonesia Menuju Masyarakat Madani*.
- Makalah "Pembentukan Insan Cerdas Kompetitif" menarik perhatian peserta seminar.
- Perhatikan "Pemakaian Tanda Baca" dalam buku *Pedoman Umum Ejaan Bahasa Indonesia yang Disempurnakan*.

!!! important ""
	**III.J.3** Tanda petik dipakai untuk mengapit istilah ilmiah yang kurang dikenal atau kata yang mempunyai arti khusus.

Misalnya:

- "Tetikus" komputer ini sudah tidak berfungsi.
- Dilarang memberikan "amplop" kepada petugas!');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-titik-dua', 'D. Tanda Titik Dua (:)', 'tanda-baca/tanda-titik-dua.md', '# D. Tanda Titik Dua (:)

!!! important ""
	**III.D.1** Tanda titik dua dipakai pada akhir suatu pernyataan lengkap yang diikuti pemerincian atau penjelasan.

Misalnya:

- Mereka memerlukan perabot rumah tangga: kursi, meja, dan lemari.
- Hanya ada dua pilihan bagi para pejuang kemerdekaan: hidup atau mati.

!!! important ""
	**III.D.2** Tanda titik dua *tidak* dipakai jika perincian atau penjelasan itu merupakan pelengkap yang mengakhiri pernyataan.

Misalnya:

- Kita memerlukan kursi, meja, dan lemari.
- Tahap penelitian yang harus dilakukan meliputi  
a. persiapan,  
b. pengumpulan data,  
c. pengolahan data, dan  
d. pelaporan.  

!!! important ""
	**III.D.3** Tanda titik dua dipakai sesudah kata atau ungkapan yang memerlukan pemerian.

Misalnya:

- Ketua : Ahmad Wijaya  
Sekretaris : Siti Aryani  
Bendahara : Aulia Arimbi
- Narasumber : Prof. Dr. Rahmat Effendi  
Pemandu : Abdul Gani, M.Hum.  
Pencatat : Sri Astuti Amelia, S.Pd.  

!!! important ""
	**III.D.4** Tanda titik dua dipakai dalam naskah drama sesudah kata yang menunjukkan pelaku dalam percakapan.

Misalnya:

- Ibu : "Bawa koper ini, Nak!"  
Amir : "Baik, Bu."  
Ibu : "Jangan lupa, letakkan baik-baik!"  

!!! important ""
	**III.D.5** Tanda titik dua dipakai di antara (a) jilid atau nomor dan halaman, (b) surah dan ayat dalam kitab suci, (c) judul dan anak judul suatu karangan, serta (d) nama kota dan penerbit dalam daftar pustaka.

Misalnya:

- *Horison*, XLIII, No. 8/2008: 8
- Surah Albaqarah: 2—5
- Matius 2: 1—3
- *Dari Pemburu ke Terapeutik: Antologi Cerpen Nusantara*
- *Pedoman Umum Pembentukan Istilah*. Jakarta: Pusat Bahasa.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-kurung', 'L. Tanda Kurung ((…))', 'tanda-baca/tanda-kurung.md', '# L. Tanda Kurung ((…))

!!! important ""
	**III.L.1** Tanda kurung dipakai untuk mengapit tambahan keterangan atau penjelasan.

Misalnya:

- Dia memperpanjang surat izin mengemudi (SIM).
- Warga baru itu belum memiliki KTP (kartu tanda penduduk).
- Lokakarya (*workshop*) itu diadakan di Manado.

!!! important ""
	**III.L.2** Tanda kurung dipakai untuk mengapit keterangan atau penjelasan yang bukan bagian utama kalimat.

Misalnya:

- Sajak Tranggono yang berjudul "Ubud" (nama tempat yang terkenal di Bali) ditulis pada tahun 1962.
- Keterangan itu (lihat Tabel 10) menunjukkan arus perkembangan baru pasar dalam negeri.

!!! important ""
	**III.L.3** Tanda kurung dipakai untuk mengapit huruf atau kata yang keberadaannya di dalam teks dapat dimunculkan atau dihilangkan.

Misalnya:

- Dia berangkat ke kantor selalu menaiki (bus) Transjakarta.
- Pesepak bola kenamaan itu berasal dari (Kota) Padang.

!!! important ""
	**III.L.4** Tanda kurung dipakai untuk mengapit huruf atau angka yang digunakan sebagai penanda pemerincian.

Misalnya:

- Faktor produksi menyangkut (a) bahan baku, (b) biaya produksi, dan (c) tenaga kerja.
- Dia harus melengkapi berkas lamarannya dengan melampirkan  
(1) akta kelahiran,  
(2) ijazah terakhir, dan  
(3) surat keterangan kesehatan.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-elipsis', 'I. Tanda Elipsis (…)', 'tanda-baca/tanda-elipsis.md', '# I. Tanda Elipsis (…)

!!! important ""
	**III.I.1** Tanda elipsis dipakai untuk menunjukkan bahwa dalam suatu kalimat atau kutipan ada bagian yang dihilangkan.

Misalnya:

- Penyebab kemerosotan ... akan diteliti lebih lanjut.
- Dalam Undang-Undang Dasar 1945 disebutkan bahwa bahasa negara ialah ....
- ..., lain lubuk lain ikannya.

Catatan:

(1) Tanda elipsis itu didahului dan diikuti dengan spasi.

(2) Tanda elipsis pada akhir kalimat diikuti oleh tanda titik (jumlah titik empat buah).

!!! important ""
	**III.I.2** Tanda elipsis dipakai untuk menulis ujaran yang tidak selesai dalam dialog.

Misalnya:

- "Menurut saya ... seperti ... bagaimana, Bu?"
- "Jadi, simpulannya ... oh, sudah saatnya istirahat."

Catatan:

(1) Tanda elipsis itu didahului dan diikuti dengan spasi.

(2) Tanda elipsis pada akhir kalimat diikuti oleh tanda titik (jumlah titik empat buah).');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-seru', 'H. Tanda Seru (!)', 'tanda-baca/tanda-seru.md', '# H. Tanda Seru (!)

!!! important ""
	Tanda seru dipakai untuk mengakhiri ungkapan atau pernyataan yang berupa seruan atau perintah yang menggambarkan kesungguhan, ketidakpercayaan, atau emosi yang kuat.

Misalnya:

- Alangkah indahnya taman laut di Bunaken!
- Mari kita dukung Gerakan Cinta Bahasa Indonesia!
- Bayarlah pajak tepat pada waktunya!
- Masa! Dia bersikap seperti itu?
- Merdeka!');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-pisah', 'F. Tanda Pisah (—)', 'tanda-baca/tanda-pisah.md', '# F. Tanda Pisah (—)

!!! important ""
	**III.F.1** Tanda pisah dapat dipakai untuk membatasi penyisipan kata atau kalimat yang memberi penjelasan di luar bangun kalimat.

Misalnya:

- Kemerdekaan bangsa itu—*saya yakin akan tercapai*—diperjuangkan oleh bangsa itu sendiri.
- Keberhasilan itu—*kita sependapat*—dapat dicapai jika kita mau berusaha keras.

!!! important ""
	**III.F.2** Tanda pisah dapat dipakai juga untuk menegaskan adanya keterangan aposisi atau keterangan yang lain.

Misalnya:

- Soekarno-Hatta—*Proklamator Kemerdekaan RI*—diabadikan menjadi nama bandar udara internasional.
- Rangkaian temuan ini—*evolusi, teori kenisbian, dan pembelahan atom*—telah mengubah konsepsi kita tentang alam semesta.
- Gerakan Pengutamaan Bahasa Indonesia—*amanat Sumpah Pemuda*—harus terus digelorakan.

!!! important ""
	**III.F.3** Tanda pisah dipakai di antara dua bilangan, tanggal, atau tempat yang berarti ''sampai dengan'' atau ''sampai ke''.

Misalnya:

- Tahun 2010—2013
- Tanggal 5—10 April 2013
- Jakarta—Bandung');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-penyingkat-apostrof', 'O. Tanda Penyingkat ('''')', 'tanda-baca/tanda-penyingkat-apostrof.md', '# O. Tanda Penyingkat ('''')

!!! important ""
	Tanda penyingkat atau apostrof dipakai untuk menunjukkan penghilangan bagian kata atau bagian angka tahun dalam konteks tertentu.

Misalnya:

- Dia ''kan kusurati. (''kan = akan)
- Mereka sudah datang, ''kan? (''kan = bukan)
- Malam ''lah tiba. (''lah = telah)
- 5-2-''13 (''13 = 2013)');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-titik-koma', 'C. Tanda Titik Koma (;)', 'tanda-baca/tanda-titik-koma.md', '# C. Tanda Titik Koma (;)

!!! important ""
	**III.C.1** Tanda titik koma dapat dipakai sebagai pengganti kata penghubung untuk memisahkan kalimat setara yang satu dari kalimat setara yang lain di dalam kalimat majemuk.

Misalnya:

- Hari sudah malam; anak-anak masih membaca buku.
- Ayah menyelesaikan pekerjaan; Ibu menulis makalah; Adik membaca cerita pendek.

!!! important ""
	**III.C.2** Tanda titik koma dipakai pada akhir perincian yang berupa klausa.

Misalnya:

Syarat penerimaan pegawai di lembaga ini adalah  
(1) berkewarganegaraan Indonesia;  
(2) berijazah sarjana S-1;  
(3) berbadan sehat; dan  
(4) bersedia ditempatkan di seluruh wilayah Negara Kesatuan Republik Indonesia.  

!!! important ""
	**III.C.3** Tanda titik koma dipakai untuk memisahkan bagian-bagian pemerincian dalam kalimat yang sudah menggunakan tanda koma.

Misalnya:

- Ibu membeli buku, pensil, dan tinta; baju, celana, dan kaus; pisang, apel, dan jeruk.
- Agenda rapat ini meliputi  
    a. pemilihan ketua, sekretaris, dan bendahara;  
    b. penyusunan anggaran dasar, anggaran rumah tangga, dan program kerja; dan  
    c. pendataan anggota, dokumentasi, dan aset organisasi.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('index', 'III. Pemakaian Tanda Baca', 'tanda-baca/index.md', '# III. Pemakaian Tanda Baca

A. [Tanda Titik (.)](tanda-titik.md)  
B. [Tanda Koma (,)](tanda-koma.md)  
C. [Tanda Titik Koma (;)](tanda-titik-koma.md)  
D. [Tanda Titik Dua (:)](tanda-titik-dua.md)  
E. [Tanda Hubung (-)](tanda-hubung.md)  
F. [Tanda Pisah (—)](tanda-pisah.md)  
G. [Tanda Tanya (?)](tanda-tanya.md)  
H. [Tanda Seru (!)](tanda-seru.md)  
I. [Tanda Elipsis (…)](tanda-elipsis.md)  
J. [Tanda Petik ("…")](tanda-petik.md)  
K. [Tanda Petik Tunggal (''…'')](tanda-petik-tunggal.md)  
L. [Tanda Kurung ((…))](tanda-kurung.md)  
M. [Tanda Kurung Siku ([…])](tanda-kurung-siku.md)  
N. [Tanda Garis Miring (/)](tanda-garis-miring.md)  
O. [Tanda Penyingkat ('''')](tanda-penyingkat-apostrof.md)');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-hubung', 'E. Tanda Hubung (-)', 'tanda-baca/tanda-hubung.md', '# E. Tanda Hubung (-)

!!! important ""
	**III.E.1** Tanda hubung dipakai untuk menandai bagian kata yang terpenggal oleh pergantian baris.

Misalnya:

- Di samping cara lama, diterapkan juga ca-<br>
ra baru ….
- Nelayan pesisir itu berhasil membudidayakan rum-<br>
put laut.
- Kini ada cara yang baru untuk meng-<br>
ukur panas.
- Parut jenis ini memudahkan kita me-<br>
ngukur kelapa.

!!! important ""
	**III.E.2** Tanda hubung dipakai untuk menyambung unsur kata ulang.

Misalnya:

- anak-anak
- berulang-ulang
- kemerah-merahan
- mengorek-ngorek

!!! important ""
	**III.E.3** Tanda hubung dipakai untuk menyambung tanggal, bulan, dan tahun yang dinyatakan dengan angka atau menyambung huruf dalam kata yang dieja satu-satu.

Misalnya:

- 11-11-2013
- p-a-n-i-t-i-a

!!! important ""
	**III.E.4** Tanda hubung dapat dipakai untuk memperjelas hubungan bagian kata atau ungkapan.

Misalnya:

- ber-evolusi
- meng-ukur
- dua-puluh-lima ribuan (25 x 1.000)
- 23/25 (dua-puluh-tiga perdua-puluh-lima)
- mesin hitung-tangan

Bandingkan dengan

- be-revolusi
- me-ngukur
- dua-puluh lima-ribuan (20 x 5.000)
- 20 3/25 (dua-puluh tiga perdua-puluh-lima)
- mesin-hitung tangan

!!! important ""
	**III.E.5** Tanda hubung dipakai untuk merangkai  
	a. *se-* dengan kata berikutnya yang dimulai dengan huruf kapital (*se-*Indonesia, *se-*Jawa Barat);  
	b. *ke-* dengan angka (peringkat *ke-*2);  
	c. angka dengan *–an* (tahun 1950*-an*);  
	d. kata atau imbuhan dengan singkatan yang berupa huruf kapital (hari-*H*, sinar-*X*, ber-*KTP*, di-*SK*-kan);
	e. kata dengan kata ganti Tuhan (ciptaan-*Nya*, atas rahmat-*Mu*);  
	f. huruf dan angka (D-3, S-1, S-2); dan  
	g. kata ganti *-ku*, *-mu*, dan *-nya* dengan singkatan yang berupa huruf kapital (KTP-*mu*, SIM-*nya*, STNK-*ku*).  

Catatan: Tanda hubung *tidak* dipakai di antara huruf dan angka jika angka tersebut melambangkan jumlah huruf.

Misalnya:

- BNP2TKI (Badan Nasional Penempatan dan Perlindungan Tenaga Kerja Indonesia)
- LP3I (Lembaga Pendidikan dan Pengembangan Profesi Indonesia)
- P3K (pertolongan pertama pada kecelakaan)

!!! important ""
	**III.E.6** Tanda hubung dipakai untuk merangkai unsur bahasa Indonesia dengan unsur bahasa daerah atau bahasa asing.

Misalnya:

- di-*sowan*-i (bahasa Jawa, ''didatangi'')
- ber-*pariban* (bahasa Batak, ''bersaudara sepupu'')
- di-*back up*
- me-*recall*
- pen-*tackle*-an

!!! important ""
	**III.E.7** Tanda hubung digunakan untuk menandai bentuk terikat yang menjadi objek bahasan.

Misalnya:

- Kata *pasca-* berasal dari bahasa Sanskerta.
- Akhiran *-isasi* pada kata *betonisasi* sebaiknya diubah menjadi *pembetonan*.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-titik', 'A. Tanda Titik (.)', 'tanda-baca/tanda-titik.md', '# A. Tanda Titik (.)

!!! important ""
	**III.A.1** Tanda titik dipakai pada akhir kalimat pernyataan.

Misalnya:

- Mereka duduk di sana.
- Dia akan datang pada pertemuan itu.

!!! important ""
	**III.A.2** Tanda titik dipakai di belakang angka atau huruf dalam suatu bagan, ikhtisar, atau daftar.

Misalnya:

- I\\. Kondisi Kebahasaan di Indonesia  
&nbsp;&nbsp;&nbsp;&nbsp;A\\. Bahasa Indonesia  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1\\. Kedudukan  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2\\. Fungsi  
&nbsp;&nbsp;&nbsp;&nbsp;B\\. Bahasa Daerah  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1\\. Kedudukan  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2\\. Fungsi  
&nbsp;&nbsp;&nbsp;&nbsp;C\\. Bahasa Asing  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1\\. Kedudukan  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2\\. Fungsi  
- 1\\. Patokan Umum  
1\\.1 Isi Karangan  
1\\.2 Ilustrasi  
1\\.2.1 Gambar Tangan  
1\\.2.2 Tabel  
1\\.2.3 Grafik  
2\\. Patokan Khusus  
...  

Catatan:

(1) Tanda titik *tidak* dipakai pada angka atau huruf yang sudah bertanda kurung dalam suatu perincian.

Misalnya:

Bahasa Indonesia berkedudukan sebagai  
1) bahasa nasional yang berfungsi, antara lain,  
a) lambang kebanggaan nasional,  
b) identitas nasional, dan  
c) alat pemersatu bangsa;  
2) bahasa negara ....  

(2) Tanda titik *tidak* dipakai pada akhir penomoran digital yang lebih dari satu angka (seperti pada Misalnya III.A.2.b).

(3) Tanda titik *tidak* dipakai di belakang angka atau angka terakhir dalam penomoran deret digital yang lebih dari satu angka dalam judul tabel, bagan, grafik, atau gambar.

Misalnya:

- Tabel 1 Kondisi Kebahasaan di Indonesia
- Tabel 1.1 Kondisi Bahasa Daerah di Indonesia
- Bagan 2 Struktur Organisasi
- Bagan 2.1 Bagian Umum
- Grafik 4 Sikap Masyarakat Perkotaan terhadap Bahasa Indonesia
- Grafik 4.1 Sikap Masyarakat Berdasarkan Usia
- Gambar 1 Gedung Cakrawala
- Gambar 1.1 Ruang Rapat

!!! important ""
	**III.A.3** Tanda titik dipakai untuk memisahkan angka jam, menit, dan detik yang menunjukkan waktu atau jangka waktu.

Misalnya:

- pukul 01.35.20 (pukul 1 lewat 35 menit 20 detik atau pukul 1, 35 menit, 20 detik)
- 01.35.20 jam (1 jam, 35 menit, 20 detik)
- 00.20.30 jam (20 menit, 30 detik)
- 00.00.30 jam (30 detik)

!!! important ""
	**III.A.4** Tanda titik dipakai dalam daftar pustaka di antara nama penulis, tahun, judul tulisan (yang tidak berakhir dengan tanda tanya atau tanda seru), dan tempat terbit.

Misalnya:

- Pusat Bahasa, Departemen Pendidikan Nasional. 2008. *Peta Bahasa di Negara Kesatuan Republik Indonesia*. Jakarta.
- Moeliono, Anton M. 1989. *Kembara Bahasa*. Jakarta: Gramedia.

!!! important ""
	**III.A.5** Tanda titik dipakai untuk memisahkan [bilangan](../kata/angka-dan-bilangan) ribuan atau kelipatannya yang menunjukkan jumlah.

Misalnya:

- Indonesia memiliki lebih dari *13.000* pulau.
- Penduduk kota itu lebih dari *7.000.000* orang.
- Anggaran lembaga itu mencapai *Rp225.000.000.000,00*.

Catatan:

(1) Tanda titik *tidak* dipakai untuk memisahkan bilangan ribuan atau kelipatannya yang tidak menunjukkan jumlah.

Misalnya:

- Dia lahir pada tahun *1956* di Bandung.
- Kata sila terdapat dalam *Kamus Besar Bahasa Indonesia Pusat Bahasa* halaman *1305*.
- Nomor rekening panitia seminar adalah *0015645678*.

(2) Tanda titik *tidak* dipakai pada akhir judul yang merupakan kepala karangan, ilustrasi, atau tabel.

Misalnya:

- Acara Kunjungan Menteri Pendidikan dan Kebudayaan
- Bentuk dan Kedaulatan (Bab I UUD 1945)
- Gambar 3 Alat Ucap Manusia
- Tabel 5 Sikap Bahasa Generasi Muda Berdasarkan Pendidikan

(3) Tanda titik *tidak* dipakai di belakang (a) alamat penerima dan pengirim surat serta (b) tanggal surat.

Misalnya:

- Yth. Direktur Taman Ismail Marzuki  
Jalan Cikini Raya No. 73  
Menteng  
Jakarta 10330
- Yth. Kepala Badan Pengembangan dan Pembinaan Bahasa  
Jalan Daksinapati Barat IV  
Rawamangun  
Jakarta Timur
- Indrawati, M.Hum.  
Jalan Cempaka II No. 9  
Jakarta Timur
- 21 April 2013
- Jakarta, 15 Mei 2013 (tanpa kop surat)');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-koma', 'B. Tanda Koma (,)', 'tanda-baca/tanda-koma.md', '# B. Tanda Koma (,)

!!! important ""
	**III.B.1** Tanda koma dipakai di antara unsur-unsur dalam suatu pemerincian atau pembilangan.

Misalnya:

- Telepon seluler, komputer, atau internet bukan barang asing lagi.
- Buku, majalah, dan jurnal termasuk sumber kepustakaan.
- Satu, dua, ... tiga!

!!! important ""
	**III.B.2** Tanda koma dipakai sebelum kata penghubung, seperti *tetapi*, *melainkan*, dan *sedangkan*, dalam kalimat majemuk (setara).

Misalnya:

- Saya ingin membeli kamera, *tetapi* uang saya belum cukup.
- Ini bukan milik saya, *melainkan* milik ayah saya.
- Dia membaca cerita pendek, *sedangkan* adiknya melukis panorama.

!!! important ""
	**III.B.3** Tanda koma dipakai untuk memisahkan anak kalimat yang mendahului induk kalimatnya.

Misalnya:

- *Kalau diundang*, saya akan datang.
- *Karena baik hati*, dia mempunyai banyak teman.
- *Agar memiliki wawasan yang luas*, kita harus banyak membaca buku.

Catatan: Tanda koma *tidak* dipakai jika induk kalimat mendahului anak kalimat.

Misalnya:

- Saya akan datang *kalau diundang*.
- Dia mempunyai banyak teman *karena baik hati*.
- Kita harus banyak membaca buku *agar memiliki wawasan yang luas*.

!!! important ""
	**III.B.4** Tanda koma dipakai di belakang kata atau ungkapan penghubung antarkalimat, seperti oleh karena itu, jadi, dengan demikian, sehubungan dengan itu, dan meskipun demikian.

Misalnya:

- Mahasiswa itu rajin dan pandai. *Oleh karena itu*, dia memperoleh beasiswa belajar di luar negeri.
- Anak itu memang rajin membaca sejak kecil. *Jadi*, wajar kalau dia menjadi bintang pelajar
- Orang tuanya kurang mampu. *Meskipun demikian*, anak-anaknya berhasil menjadi sarjana.

!!! important ""
	**III.B.5** Tanda koma dipakai sebelum dan/atau sesudah kata seru, seperti *o*, *ya*, *wah*, *aduh*, atau *hai*, dan kata yang dipakai sebagai sapaan, seperti *Bu*, *Dik*, atau *Nak*.

Misalnya:

- *O*, begitu?
- *Wah*, bukan main!
- Hati-hati, *ya*, jalannya licin!
- *Nak*, kapan selesai kuliahmu?
- Siapa namamu, *Dik*?
- Dia baik sekali, *Bu*.

!!! important ""
	**III.B.6** Tanda koma dipakai untuk memisahkan petikan langsung dari bagian lain dalam kalimat.

Misalnya:

- Kata nenek saya, "Kita harus berbagi dalam hidup ini."
- "Kita harus berbagi dalam hidup ini," kata nenek saya, "karena manusia adalah makhluk sosial."

Catatan: Tanda koma *tidak* dipakai untuk memisahkan petikan langsung yang berupa kalimat tanya, kalimat perintah, atau kalimat seru dari bagian lain yang mengikutinya.

Misalnya:

- "Di mana Saudara tinggal?" tanya Pak Lurah.
- "Masuk ke dalam kelas sekarang!" perintahnya.
- "Wow, indahnya pantai ini!" seru wisatawan itu.

!!! important ""
	**III.B.7** Tanda koma dipakai di antara (a) nama dan alamat, (b) bagian-bagian alamat, (c) tempat dan tanggal, serta (d) nama tempat dan wilayah atau negeri yang ditulis berurutan.

Misalnya:

- Sdr. Abdullah, Jalan Kayumanis III/18, Kelurahan Kayumanis, Kecamatan Matraman, Jakarta 13130
- Dekan Fakultas Kedokteran, Universitas Indonesia, Jalan Salemba Raya 6, Jakarta
- Surabaya, 10 Mei 1960
- Tokyo, Jepang

!!! important ""
	**III.B.8** Tanda koma dipakai untuk memisahkan bagian nama yang dibalik susunannya dalam daftar pustaka.

Misalnya:

- Gunawan, Ilham. 1984. *Kamus Politik Internasional*. Jakarta: Restu Agung.
- Halim, Amran (Ed.) 1976. *Politik Bahasa Nasional*. Jilid 1. Jakarta: Pusat Bahasa.
- Tulalessy, D. dkk. 2005. *Pengembangan Potensi Wisata Bahari di Wilayah Indonesia Timur*. Ambon: Mutiara Beta.

!!! important ""
	**III.B.9** Tanda koma dipakai di antara bagian-bagian dalam catatan kaki atau catatan akhir.

Misalnya:

- Sutan Takdir Alisjahbana, *Tata Bahasa Baru Bahasa Indonesia*, Jilid 2 (Jakarta: Pustaka Rakyat, 1950), hlm. 25.
- Hadikusuma Hilman, *Ensiklopedi Hukum Adat dan Adat Budaya Indonesia* (Bandung: Alumni, 1977), hlm. 12.
- W.J.S. Poerwadarminta, *Bahasa Indonesia untuk Karang-mengarang* (Jogjakarta: UP Indonesia, 1967), hlm. 4.

!!! important ""
	**III.B.10** Tanda koma dipakai di antara nama orang dan singkatan gelar akademis yang mengikutinya untuk membedakannya dari singkatan nama diri, keluarga, atau marga.

Misalnya:

- B. Ratulangi, S.E.
- Ny. Khadijah, M.A.
- Bambang Irawan, M.Hum.
- Siti Aminah, S.H., M.H.

Catatan: Bandingkan *Siti Khadijah, M.A.* dengan *Siti Khadijah M.A.* (*Siti Khadijah Mas Agung*).

!!! important ""
	**III.B.11** Tanda koma dipakai sebelum angka desimal atau di antara rupiah dan sen yang dinyatakan dengan angka.

Misalnya:

- 12,5 m
- 27,3 kg
- Rp500,50
- Rp750,00

!!! important ""
	**III.B.12** Tanda koma dipakai untuk mengapit keterangan tambahan atau keterangan aposisi.

Misalnya:

- Di daerah kami, *misalnya*, masih banyak bahan tambang yang belum diolah.
- Semua siswa, *baik laki-laki maupun perempuan*, harus mengikuti latihan paduan suara.
- Soekarno, *Presiden I RI*, merupakan salah seorang pendiri Gerakan Nonblok.
- Pejabat yang bertanggung jawab, *sebagaimana dimaksud pada ayat (3)*, wajib menindaklanjuti laporan dalam waktu paling lama tujuh hari.

Bandingkan dengan keterangan pewatas yang pemakaiannya tidak diapit tanda koma!

- Siswa *yang lulus dengan nilai tinggi* akan diterima di perguruan tinggi itu tanpa melalui tes.

!!! important ""
	**III.B.13** Tanda koma *dapat* dipakai di belakang keterangan yang terdapat pada awal kalimat untuk menghindari salah baca/salah pengertian.

Misalnya:

- *Dalam pengembangan bahasa*, kita dapat memanfaatkan bahasa daerah.
- *Atas perhatian Saudara*, kami ucapkan terima kasih.

Bandingkan dengan:

- *Dalam pengembangan bahasa* kita dapat memanfaatkan bahasa daerah.
- *Atas perhatian Saudara* kami ucapkan terima kasih.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-petik-tunggal', 'K. Tanda Petik Tunggal (''…'')', 'tanda-baca/tanda-petik-tunggal.md', '# K. Tanda Petik Tunggal (''…'')

!!! important ""
	**III.K.1** Tanda petik tunggal dipakai untuk mengapit petikan yang terdapat dalam petikan lain.

Misalnya:

- Tanya dia, "Kaudengar bunyi ''kring-kring'' tadi?"
- "Kudengar teriak anakku, ''Ibu, Bapak pulang!'', dan rasa letihku lenyap seketika,"ujar Pak Hamdan.
- "Kita bangga karena lagu ''Indonesia Raya'' berkumandang di arena olimpiade itu," kata Ketua KONI.

!!! important ""
	**III.K.2** Tanda petik tunggal dipakai untuk mengapit makna, terjemahan, atau penjelasan kata atau ungkapan.

Misalnya:

- tergugat ''yang digugat''
- retina ''dinding mata sebelah dalam''
- *noken* ''tas khas Papua''
- *tadulako* ''panglima''
- *marsiadap ari* ''saling bantu''
- *tuah sakato* ''sepakat demi manfaat bersama''
- *policy* ''kebijakan''
- *wisdom* ''kebijaksanaan''
- *money politics* ''politik uang''');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-kurung-siku', 'M. Tanda Kurung Siku ([…])', 'tanda-baca/tanda-kurung-siku.md', '# M. Tanda Kurung Siku ([…])

!!! important ""
	**III.M.1** Tanda kurung siku dipakai untuk mengapit huruf, kata, atau kelompok kata sebagai koreksi atau tambahan atas kesalahan atau kekurangan di dalam naskah asli yang ditulis orang lain.

Misalnya:

- Sang Sapurba men[d]engar bunyi gemerisik.
- Penggunaan bahasa dalam karya ilmiah harus sesuai [dengan] kaidah bahasa Indonesia.
- Ulang tahun [Proklamasi Kemerdekaan] Republik Indonesia dirayakan secara khidmat.

!!! important ""
	**III.M.2** Tanda kurung siku dipakai untuk mengapit keterangan dalam kalimat penjelas yang terdapat dalam tanda kurung.

Misalnya:

- Persamaan kedua proses itu (perbedaannya dibicarakan di dalam Bab II [lihat halaman 35-38]) perlu dibentangkan di sini.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-garis-miring', 'N. Tanda Garis Miring (/)', 'tanda-baca/tanda-garis-miring.md', '# N. Tanda Garis Miring (/)

!!! important ""
	**III.N.1** Tanda garis miring dipakai dalam nomor surat, nomor pada alamat, dan penandaan masa satu tahun yang terbagi dalam dua tahun takwim.

Misalnya:

- Nomor: 7/PK/II/2013
- Jalan Kramat III/10
- tahun ajaran 2012/2013

!!! important ""
	**III.N.2** Tanda garis miring dipakai sebagai pengganti kata *dan*, *atau*, serta *setiap*.

Misalnya:

- mahasiswa/mahasiswi = ''mahasiswa *dan* mahasiswi''
- dikirimkan lewat darat/laut = ''dikirimkan lewat darat *atau* lewat laut''
- buku dan/atau majalah = ''buku dan majalah *atau* buku atau majalah''
- harganya Rp1.500,00/lembar = ''harganya Rp1.500,00 *setiap* lembar''

!!! important ""
	**III.N.3** Tanda garis miring dipakai untuk mengapit huruf, kata, atau kelompok kata sebagai koreksi atau pengurangan atas kesalahan atau kelebihan di dalam naskah asli yang ditulis orang lain.

Misalnya:

- Buku *Pengantar Ling/g/uistik* karya Verhaar dicetak beberapa kali.
- *Asmara/n/dana* merupakan salah satu tembang macapat budaya Jawa.
- Dia sedang menyelesaikan /h/utangnya di bank.');

INSERT INTO puebi_entries (slug, title, path, content_markdown) VALUES ('tanda-tanya', 'G. Tanda Tanya (?)', 'tanda-baca/tanda-tanya.md', '# G. Tanda Tanya (?)

!!! important ""
	**III.G.1** Tanda tanya dipakai pada akhir kalimat tanya.

Misalnya:

- Kapan Hari Pendidikan Nasional diperingati?
- Siapa pencipta lagu "Indonesia Raya"?

!!! important ""
	**III.G.2** Tanda tanya dipakai di dalam tanda kurung untuk menyatakan bagian kalimat yang disangsikan atau yang kurang dapat dibuktikan kebenarannya.

Misalnya:

- Monumen Nasional mulai dibangun pada tahun 1961 (?).
- Di Indonesia terdapat 740 (?) bahasa daerah.');
