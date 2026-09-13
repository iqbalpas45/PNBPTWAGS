# 📋 Portal Rekapitulasi TWA GS - Panduan Penggunaan

## 🎯 Pengenalan Aplikasi

**Portal Rekapitulasi TWA GS** adalah sistem manajemen transaksi untuk mencatat dan merekap penerimaan di lokasi TWA GS dengan fitur:
- Pencatatan transaksi harian (Nusantara/Asing, Cash/QRIS/VA)
- Rekapitulasi per loket & periode
- Split transfer dengan perhitungan otomatis
- Laporan bulanan
- Pengaturan tarif dinamis

---

## 🔐 LOGIN

**Username:** `firesky`

1. Buka aplikasi
2. Masukkan username: `firesky`
3. Klik **Login**
4. Dashboard muncul dengan data transaksi

---

## 📊 MENU UTAMA (6 Tab)

### 1️⃣ **Dashboard**
- **Ringkasan total pengunjung & pendapatan**
- Menampilkan: Total Pengunjung, Total Pendapatan, Transaksi Tercatat
- Tabel Rekapitulasi per Loket (Loket 1, Loket 2)

**Cara pakai:**
- View otomatis saat login
- Gunakan untuk monitoring harian

---

### 2️⃣ **Input Harian**
- **Pencatatan transaksi baru setiap hari**

**Fields:**
- 📅 Tanggal (auto-fill tarif berdasarkan kerja/libur)
- 🏪 Loket (1 atau 2)
- 👥 **Nusantara (WNI):**
  - Cash
  - QRIS
  - VA (Virtual Account)
- 🌍 **Asing (Mancanegara):**
  - Cash
  - QRIS
  - VA

**Tarif (auto-update):**
- Nusantara Kerja/Libur
- Asing Kerja/Libur

**Cara pakai:**
1. Pilih tanggal
2. Pilih loket
3. Isi jumlah tiket per metode pembayaran
4. Sistem auto-hitung total & pendapatan
5. Klik **💾 Simpan Transaksi**

---

### 3️⃣ **Rekap Tunai**
- **Rekapitulasi pendapatan per periode mingguan**
- 2 periode: Senin-Rabu & Kamis-Minggu
- Breakdown per loket & metode pembayaran (Cash/QRIS/VA)

**Informasi yang ditampilkan:**
- Total pengunjung per loket
- Total pendapatan per loket
- Rincian harian dalam periode

**Cara pakai:**
- View otomatis
- Gunakan untuk laporan tunai mingguan

---

### 4️⃣ **Split Transfer**
- **Perhitungan split transfer ke berbagai rekening**
- Detail komponen: PNBP, PTDID, Asuransi per loket/hari

**Format keterangan otomatis:**
```
TWAGS [Komponen] [HK/HL] [Tipe] [Count] ORG x [Tarif]
```
Contoh:
```
TWAGS PNBP HK WNI 15 ORG x 10000
TWAGS PTDID HL WNA 5 ORG x 23000
```

**Cara pakai:**
- Sistem auto-kalkulasi dari input transaksi
- Gunakan untuk verifikasi split sebelum transfer

---

### 5️⃣ **Laporan Bulanan**
- **Rekapitulasi lengkap per bulan**
- Summary total pendapatan, pengunjung
- Breakdown per loket

**Cara pakai:**
1. Pilih bulan & tahun
2. View laporan otomatis
3. Print atau screenshot untuk arsip

---

### 6️⃣ **Pengaturan**
- **Manajemen hari libur & tarif dinamis**

**Sub-menu:**
- ✏️ **Edit Hari Libur:** Tambah/hapus tanggal libur custom
- 💰 **Edit Tarif:** Sesuaikan tarif WNI/WNA hari kerja/libur

**Cara pakai:**
1. Tambah hari libur baru saat ada libur nasional
2. Update tarif jika ada perubahan kebijakan
3. Sistem otomatis apply ke transaksi baru

---

## 🔄 WORKFLOW HARIAN

### Pagi (Input Transaksi)
1. Login dengan username `firesky`
2. Buka **Input Harian**
3. Isi transaksi dari loket 1 & 2
4. Klik **Simpan Transaksi**
5. Data otomatis masuk ke Dashboard

### Siang (Monitoring)
1. Buka **Dashboard** untuk cek total
2. Lihat tabel rekapitulasi per loket
3. Verifikasi kecocokan dengan sistem kasir

### Sore (Laporan Mingguan)
1. Buka **Rekap Tunai**
2. Lihat periode Senin-Rabu & Kamis-Minggu
3. Siapkan untuk reconciliation tunai

### Akhir Bulan
1. Buka **Laporan Bulanan**
2. Verifikasi total bulan
3. Print untuk arsip

---

## 💡 FITUR OTOMATIS

✅ **Deteksi Hari Libur:** Tarif otomatis berubah
✅ **Perhitungan Total:** Nusantara + Asing auto-sum
✅ **Split Transfer:** Breakdown PNBP/PTDID/Asuransi otomatis
✅ **Responsive Design:** Mobile, tablet, desktop
✅ **Dark Mode:** Support light/dark theme

---

## ⚙️ PENGATURAN LANJUTAN

### Edit Hari Libur
1. Buka **Pengaturan** → **Edit Hari Libur**
2. Klik **➕ Tambah Hari Libur**
3. Isi bulan, tanggal, nama libur
4. Klik **Simpan**

### Edit Tarif
1. Buka **Pengaturan** → **Edit Tarif**
2. Update harga untuk:
   - PNBP (WNI/WNA, Kerja/Libur)
   - PTDID (WNI/WNA, Kerja/Libur)
   - Asuransi (WNI/WNA, Kerja/Libur)
3. Klik **Simpan**

---

## 🔓 LOGOUT

1. Buka sidebar (klik hamburger ☰)
2. Klik **🚪 Logout** (merah)
3. Konfirmasi logout
4. Kembali ke login form

---

## 📱 AKSES APLIKASI

### Desktop/Laptop
```
https://pnbptwags.vercel.app/app.html
atau
https://firesky.my.id/app.html
```

### Mobile (Android/iOS)
1. Buka Chrome/Firefox
2. Masukkan URL di atas
3. Bookmark untuk akses cepat

### File Lokal
```
file:///D:/Portal-TWA-GS/app.html
```

---

## ❓ FAQ

**Q: Bagaimana jika lupa username?**
A: Username adalah `firesky` (default, tetap)

**Q: Data disimpan di mana?**
A: Cloud (Supabase) + Local browser cache

**Q: Bisa edit transaksi yang sudah disimpan?**
A: Ya, di **Dashboard** → klik **✏️ Edit** di tabel

**Q: Bagaimana jika ada kesalahan input?**
A: Klik **🗑️ Hapus**, lalu input ulang

**Q: Support offline?**
A: Ya, data cache di browser (tetapi sync ke cloud jika online)

---

## 📞 SUPPORT

Hubungi developer untuk:
- Issue teknis
- Perubahan tarif/kebijakan
- Backup data
- Custom reporting

---

**Versi:** v1.0
**Last Updated:** September 2026
**Build:** Production Ready ✅
