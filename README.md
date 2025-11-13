# Aplikasi Tugas Flutter

Aplikasi Android lengkap yang dibuat dengan Flutter, menampilkan berbagai fitur menarik seperti Biodata, Kontak, Kalkulator, Cuaca, dan Berita.

## 📱 Fitur Aplikasi

### 1. **Splash Screen** ⏱️
- Durasi: 5 detik
- Menampilkan:
  - Judul aplikasi
  - Foto profil
  - Nama mahasiswa
  - NIM
  - Loading indicator
- Otomatis berpindah ke Dashboard

### 2. **Dashboard dengan Bottom Navigation** 🧭
- 5 menu utama dengan navigasi bawah:
  - 👤 Biodata
  - 📞 Kontak
  - 🧮 Kalkulator
  - ☀️ Cuaca
  - 📰 Berita
- Setiap menu menampilkan Fragment terpisah
- Navigasi smooth dengan animasi

### 3. **Halaman Biodata** 👤
- Foto profil bulat (circle)
- Informasi: Nama, NIM, Jurusan, Deskripsi
- **Form Input Interaktif:**
  - ✏️ Text Field (Nama Lengkap)
  - 📋 Dropdown/Spinner (Pilih Jurusan)
  - ⚪ Radio Button (Jenis Kelamin)
  - 📅 Date Picker (Tanggal Lahir)
- Design modern dan responsif

### 4. **Halaman Kontak** 📞
- Daftar 15 kontak statis
- Setiap kontak menampilkan:
  - Circle avatar dengan warna unik
  - Nama lengkap
  - Nomor telepon
  - Tombol call
- Menggunakan RecyclerView (ListView.builder)
- Card design dengan elevation

### 5. **Halaman Kalkulator** 🧮
- **Operasi Dasar:**
  - Tambah (+)
  - Kurang (−)
  - Kali (×)
  - Bagi (÷)
- **Operasi Lanjutan:**
  - Kuadrat (x²)
  - Akar kuadrat (√)
- Tombol angka 0-9
- Titik desimal (.)
- Clear (C)
- Design calculator yang menarik dengan warna-warni

### 6. **Halaman Cuaca** ☀️
- Data cuaca statis untuk Jakarta
- Menampilkan:
  - Nama kota
  - Tanggal
  - Icon cuaca (matahari)
  - Suhu utama (32°C)
  - Deskripsi: Cerah Berawan
  - **Info Detail:**
    - 💧 Kelembapan
    - 🌬️ Kecepatan Angin
    - 📊 Tekanan Udara
    - 👁️ Jarak Pandang
  - **Prediksi 5 Hari**
- Design gradient biru yang menarik

### 7. **Halaman Berita** 📰
- 8 artikel berita statis
- Setiap berita menampilkan:
  - Thumbnail icon berwarna
  - Judul berita
  - Tanggal publikasi
  - Ringkasan
- Tap untuk melihat detail dalam dialog
- RecyclerView dengan card design

## 🏗️ Struktur Aplikasi

```
lib/
├── main.dart                          # Entry point aplikasi
├── screens/
│   ├── splash_screen.dart            # Splash screen 5 detik
│   └── dashboard_screen.dart         # Dashboard dengan Bottom Nav
└── fragments/
    ├── biodata_fragment.dart         # Fragment Biodata
    ├── kontak_fragment.dart          # Fragment Kontak
    ├── kalkulator_fragment.dart      # Fragment Kalkulator
    ├── cuaca_fragment.dart           # Fragment Cuaca
    └── berita_fragment.dart          # Fragment Berita
```

## 🚀 Cara Menjalankan

### Prasyarat
- Flutter SDK terinstall (versi 3.9.2 atau lebih baru)
- Android Studio atau VS Code
- Android Emulator atau perangkat Android

### Langkah-langkah:

1. **Clone atau download project ini**

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```

4. **Pilih device:**
   - Pilih Android emulator atau perangkat yang tersambung

## 🎨 Desain & Teknologi

- **Framework:** Flutter
- **Language:** Dart
- **UI Pattern:** Fragment-based dengan StatefulWidget dan StatelessWidget
- **Navigation:** Bottom Navigation Bar
- **State Management:** setState (built-in)
- **Layout:** ConstraintLayout, Column, Row, ListView, GridView
- **Components:**
  - Material Design 3
  - Custom gradients
  - Card dengan elevation
  - CircleAvatar
  - Icons dari Material Icons
  - Form widgets (TextField, Dropdown, Radio, DatePicker)

## 📝 Catatan Penting

- ✅ Semua data bersifat **STATIS** (tidak perlu database/API)
- ✅ Tidak memerlukan koneksi internet
- ✅ Navigasi menggunakan **Bottom Navigation** (bukan side drawer)
- ✅ Setiap menu adalah **Fragment** (bukan Activity terpisah)
- ✅ Design modern dan profesional
- ✅ Responsive untuk berbagai ukuran layar
- ✅ Menggunakan Material Design 3

## 👨‍💻 Informasi Developer

**Nama:** Rafi syahrulfalah
**NIM:** 152023046
**Jurusan:** Informatika

---


## 🔄 Update yang Dapat Dilakukan

Untuk pengembangan lebih lanjut, Anda dapat:
1. Mengganti foto placeholder dengan foto asli
2. Menambahkan koneksi API untuk data cuaca dan berita real-time
3. Menyimpan data biodata ke local storage (SharedPreferences)
4. Menambahkan animasi transisi yang lebih smooth
5. Integrasi dengan database SQLite untuk kontak
6. Menambahkan dark mode theme
7. Menambahkan lebih banyak operasi matematika pada kalkulator

## 📄 License

Project ini dibuat untuk keperluan pembelajaran dan tugas akademik.

---

**Selamat Menggunakan Aplikasi! 🎉**
