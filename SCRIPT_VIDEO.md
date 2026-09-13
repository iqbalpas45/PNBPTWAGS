# 🎬 SCRIPT VIDEO PENJELASAN
## Portal Rekapitulasi TWA GS v1.0

---

## SCENE 1: INTRO (00:00-00:15)

**Visual:** Logo aplikasi, Dashboard tampil penuh
**Narasi:**
"Halo! Ini adalah **Portal Rekapitulasi TWA GS**, sistem modern untuk mencatat dan merekap semua transaksi penerimaan di TWA dengan mudah, cepat, dan akurat."

**Text overlay:** "Portal Rekapitulasi TWA GS v1.0"

---

## SCENE 2: LOGIN (00:15-00:45)

**Visual:** Tampilkan login screen
**Narasi:**
"Untuk mulai, buka aplikasi dan masukkan username. **Username adalah: firesky**. Lalu klik tombol Login."

**Aksi:**
1. Type "firesky" di username field
2. Click Login button
3. Wait, dashboard appear

**Text overlay:** "Username: firesky"

---

## SCENE 3: DASHBOARD OVERVIEW (00:45-01:30)

**Visual:** Show dashboard dengan 3 cards dan table rekapitulasi
**Narasi:**
"Selamat datang! Ini adalah Dashboard - halaman utama yang menampilkan **ringkasan hari ini atau periode pilihan**."

*Point ke 3 cards:*
- "Card pertama: **Total Pengunjung** - berapa banyak pengunjung masuk ke TWA"
- "Card kedua: **Total Pendapatan** - total uang yang masuk dari semua loket"
- "Card ketiga: **Transaksi Tercatat** - berapa transaksi yang sudah input"

*Point ke table:*
- "Bagian bawah adalah **Tabel Rekapitulasi per Loket** - rincian per loket 1 dan loket 2 dengan jumlah pengunjung dan pendapatan"

**Text overlay:** "Dashboard = Ringkasan Harian"

---

## SCENE 4: MENU NAVIGATION (01:30-02:00)

**Visual:** Click hamburger menu, expand sidebar
**Narasi:**
"Untuk akses menu-menu lain, klik hamburger icon (≡) di sudut kiri atas. Sidebar akan muncul dengan 6 menu utama."

**List menu dengan icons:**
1. 🏠 Dashboard - Ringkasan harian
2. ✏️ Input Harian - Catat transaksi baru
3. 📋 Rekap Tunai - Rekapitulasi mingguan
4. 🔄 Split Transfer - Perhitungan split
5. 📊 Laporan Bulanan - Laporan end-of-month
6. ⚙️ Pengaturan - Edit hari libur & tarif

**Text overlay:** "6 Menu Utama Aplikasi"

---

## SCENE 5: INPUT HARIAN (02:00-04:00)

**Visual:** Open "Input Harian" tab
**Narasi:**
"Mari kita masuk ke **Input Harian** - tempat kita mencatat setiap transaksi dari loket."

**Show form fields:**

**Langkah 1 - Pilih Tanggal:**
*Point ke date field*
"Pertama, pilih tanggal transaksi. Sistem otomatis akan mendeteksi apakah hari itu hari kerja atau libur, dan apply tarif yang sesuai."

**Langkah 2 - Pilih Loket:**
"Kedua, pilih loket mana yang menjual tiket ini. Pilihan: Loket 1 atau Loket 2."

**Langkah 3 - Input Tiket Nusantara (WNI):**
*Point ke 3 input fields*
"Ketiga, input jumlah tiket yang terjual untuk **Nusantara (WNI)** dengan 3 metode pembayaran:
- **Cash** - uang tunai
- **QRIS** - QR code payment
- **VA** - Virtual Account"

**Langkah 4 - Input Tiket Asing (Mancanegara):**
"Keempat, sama seperti Nusantara, input tiket **Asing (Mancanegara)** dengan 3 metode pembayaran yang sama."

**Show Tarif Info:**
*Point ke tarif display*
"Lihat di sebelah kanan - sistem sudah auto-display tarif untuk hari ini. Misal: Nusantara Rp 27.000, Asing Rp 125.000. Tarif ini berubah otomatis jika hari libur."

**Langkah 5 - Simpan:**
"Setelah semua terisi, klik **Simpan Transaksi**. Data otomatis masuk ke Dashboard dan tersimpan di cloud."

**Text overlay:** "Input Harian = Catat Penjualan"

---

## SCENE 6: REKAP TUNAI (04:00-05:00)

**Visual:** Open "Rekap Tunai" tab
**Narasi:**
"Tab berikutnya adalah **Rekap Tunai** - ini adalah rekapitulasi mingguan yang sangat penting untuk reconciliation tunai."

**Show 2 periods:**
"Aplikasi otomatis membagi minggu menjadi 2 periode:
- **Periode 1: Senin - Rabu**
- **Periode 2: Kamis - Minggu**"

*Point ke breakdown*
"Untuk setiap periode, kita bisa lihat:
- Berapa total pengunjung per loket
- Berapa total pendapatan per loket
- Breakdown detail per metode pembayaran (Cash, QRIS, VA)"

**Text overlay:** "Rekap Tunai = Mingguan"

---

## SCENE 7: SPLIT TRANSFER (05:00-06:00)

**Visual:** Open "Split Transfer" tab
**Narasi:**
"Tab **Split Transfer** menampilkan perhitungan split pembagian pendapatan ke berbagai rekening."

*Point ke table with calculations*
"Sistem otomatis break down pendapatan menjadi:
- **PNBP** - Penerimaan Negara Bukan Pajak
- **PTDID** - (komponen lainnya)
- **Asuransi**"

*Point ke keterangan field*
"Setiap item memiliki **deskripsi otomatis** dengan format:
**TWAGS [Komponen] [HK/HL] [Tipe] [Count] ORG x [Tarif]**

Contoh: TWAGS PNBP HK WNI 15 ORG x 10000
- TWAGS = nama aplikasi
- PNBP = komponen
- HK = Hari Kerja (HL = Hari Libur)
- WNI = Warga Negara Indonesia
- 15 = jumlah
- ORG = organisasi/satuan
- 10000 = tarif"

**Text overlay:** "Split Transfer = Breakdown Pembagian Pendapatan"

---

## SCENE 8: LAPORAN BULANAN (06:00-06:45)

**Visual:** Open "Laporan Bulanan" tab
**Narasi:**
"Tab **Laporan Bulanan** adalah rekapitulasi lengkap satu bulan penuh untuk reporting dan arsip."

*Show month selector*
"Pilih bulan dan tahun yang ingin dilihat, sistem otomatis generate laporan dengan:
- Total pengunjung untuk bulan tersebut
- Total pendapatan untuk bulan tersebut
- Breakdown detail per loket
- Grafik dan ringkasan"

**Use case:**
"Laporan ini cocok untuk:
- Dikirim ke atasan/manajemen
- Disimpan sebagai arsip bulanan
- Di-print untuk dokumentasi"

**Text overlay:** "Laporan Bulanan = End-of-Month Reporting"

---

## SCENE 9: PENGATURAN (06:45-07:45)

**Visual:** Open "Pengaturan" tab
**Narasi:**
"Tab terakhir adalah **Pengaturan** - di sini kita bisa customize hari libur dan tarif dinamis."

**Sub 1 - Edit Hari Libur:**
*Show hari libur form*
"Di bagian **Edit Hari Libur**, kita bisa:
- Lihat daftar hari libur yang sudah tersimpan
- **Tambah hari libur baru** - misal untuk hari libur nasional yang baru
- **Hapus hari libur** - jika ada kesalahan

Saat ada hari libur, tarif otomatis berubah ke harga libur."

**Sub 2 - Edit Tarif:**
*Show tarif form with all components*
"Di bagian **Edit Tarif**, kita bisa update harga untuk:
- **PNBP** (WNI & WNA, Hari Kerja & Libur)
- **PTDID** (WNI & WNA, Hari Kerja & Libur)
- **Asuransi** (WNI & WNA, Hari Kerja & Libur)

Jika ada perubahan kebijakan atau tarif naik, edit di sini. Tarif baru otomatis apply ke transaksi berikutnya."

**Text overlay:** "Pengaturan = Customize Hari Libur & Tarif"

---

## SCENE 10: SIDEBAR FEATURES (07:45-08:15)

**Visual:** Show sidebar collapsed dan expanded
**Narasi:**
"Fitur bonus dari sidebar: **Sidebar bisa di-collapse jadi icon-only view**."

*Show collapse/expand*
"Klik chevron (< atau >) untuk:
- **Expand** - lihat nama menu lengkap
- **Collapse** - tampil hanya icon, hemat space di layar kecil

Terlebih lagi di mobile, sidebar otomatis collapse supaya content punya lebih banyak space."

**Text overlay:** "Sidebar = Responsive & Collapsible"

---

## SCENE 11: LOGOUT (08:15-08:30)

**Visual:** Show sidebar with Logout button
**Narasi:**
"Untuk keluar dari aplikasi, buka sidebar dan klik tombol **Logout** (berwarna merah) di bagian bawah. Setelah logout, kembali ke login form."

**Text overlay:** "Logout = Aman & Secure"

---

## SCENE 12: WORKFLOW HARIAN (08:30-09:30)

**Visual:** Timeline visualization atau montage dari setiap activity
**Narasi:**
"Berikut adalah **workflow harian yang disarankan**:"

**Pagi (07:00-09:00):**
*Show Input Harian flow*
"1. Login dengan username firesky
2. Buka **Input Harian**
3. Masukkan transaksi dari loket 1 & 2
4. Klik Simpan - data langsung masuk Dashboard"

**Siang (12:00-14:00):**
*Show Dashboard monitoring*
"5. Buka **Dashboard** untuk cek total penjualan dan pendapatan
6. Cocokkan dengan sistem kasir atau cash register
7. Verifikasi kecocokan data"

**Sore (16:00-17:00):**
*Show Rekap Tunai*
"8. Jika sudah cukup hari, buka **Rekap Tunai** untuk rekapitulasi mingguan
9. Gunakan data ini untuk reconciliation tunai"

**Akhir Bulan:**
*Show Laporan Bulanan*
"10. Buka **Laporan Bulanan** untuk generate laporan bulanan
11. Print atau kirim ke atasan untuk reporting"

**Text overlay:** "Workflow Harian Recommended"

---

## SCENE 13: BENEFITS & FEATURES (09:30-10:15)

**Visual:** Infografis atau animasi dari features
**Narasi:**
"**Keuntungan menggunakan Portal Rekapitulasi TWA GS:**

✅ **Otomatis** - Perhitungan tarif, split transfer, all otomatis
✅ **Akurat** - Tidak ada human error dalam perhitungan
✅ **Real-time** - Lihat data kapan saja, dari mana saja
✅ **Cloud-based** - Data aman disimpan di cloud
✅ **Mobile-friendly** - Bisa diakses dari smartphone
✅ **Dark mode** - Support light & dark theme untuk kenyamanan mata
✅ **Responsive** - Bagus di desktop, tablet, mobile
✅ **Historical** - Bisa lihat data bulan-bulan sebelumnya
✅ **Customizable** - Bisa update hari libur & tarif sesuai kebutuhan
✅ **Secure** - Login dengan username, session-based security"

**Text overlay:** "✅ 10 Keuntungan Utama"

---

## SCENE 14: AKSES & SUPPORT (10:15-10:45)

**Visual:** Show aplikasi di browser, mobile, dll
**Narasi:**
"**Cara mengakses Portal Rekapitulasi TWA GS:**

🌐 **Online (Vercel Cloud):**
```
https://pnbptwags.vercel.app/app.html
```

🌐 **Custom Domain (DomainNesia):**
```
https://firesky.my.id/app.html
```

💻 **File Lokal:**
```
file:///D:/Portal-TWA-GS/app.html
```

Ketiga cara akses menampilkan aplikasi yang sama dan sinkron data."

**Support:**
"Untuk pertanyaan, laporan issue, atau perubahan kebijakan, hubungi developer. Data selalu tersimpan aman di cloud dan selalu bisa di-backup."

**Text overlay:** "Akses Aplikasi 3 Cara"

---

## SCENE 15: CLOSING (10:45-11:00)

**Visual:** Montage dari semua fitur dengan musik latar yang santai
**Narasi:**
"Terima kasih sudah menonton! **Portal Rekapitulasi TWA GS** siap meningkatkan efisiensi pencatatan dan rekapitulasi transaksi Anda.

Jika ada pertanyaan, jangan ragu untuk bertanya. Selamat menggunakan! 🚀"

**Text overlay:** "Portal Rekapitulasi TWA GS v1.0 | Built with ❤️ by firesky"

**End screen:** Tampilkan logo atau info kontak

---

## 📝 CATATAN PRODUKSI

- **Durasi Total:** ~11 menit
- **Format:** 16:9 (landscape)
- **Audio:** Narasi jelas, background music ringan
- **Subtitle:** Optional (gunakan script ini)
- **Graphics:** Highlight penting dengan arrow/circle annotation
- **Pacing:** Slow enough untuk follow, tidak terlalu cepat

---

## 🎯 REKOMENDASI RECORDING

1. **Setup:** Desktop/Laptop with good screen resolution
2. **Tools:** OBS Studio (free), Camtasia, atau ScreenFlow
3. **Audio:** Gunakan external microphone untuk kualitas bagus
4. **Bahasa:** Indonesia (sesuai script ini)
5. **Editing:** Gunakan subtitle, highlight, smooth transitions

---

**Script versi:** 1.0
**Durasi:** 11 menit
**Bahasa:** Bahasa Indonesia
**Level:** Beginner - Intermediate
