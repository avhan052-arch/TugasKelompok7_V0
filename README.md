# 📱 Tugas Kelompok 7 - Flutter App

Proyek ini adalah aplikasi **Flutter** multi-platform (Android, iOS, Web, Desktop) sebagai tugas kelompok.  
Aplikasi menampilkan halaman utama dengan **AppBar**, daftar anggota kelompok menggunakan **Card**, dan navigasi sederhana dengan **Bottom Navigation Bar**.

---

## 🚀 Tampilan Aplikasi

Berikut contoh tampilan aplikasi:  

<!-- <p align="center">
  <figure>
    <figcaption><b>Versi 0</b></figcaption>
    <img src="https://raw.githubusercontent.com/avhan052-arch/TugasKelompok7_V0/main/assets/images/screenshot.jpg" 
         alt="Versi 0" width="300"/>
  </figure>
  <figure>
    <figcaption><b>Versi 1</b></figcaption>
    <img src="https://raw.githubusercontent.com/avhan052-arch/TugasKelompok7_V0/main/assets/images/screenshot1.jpg" 
         alt="Versi 1" width="300"/>
  </figure>
</p> -->

| Versi 0 | Versi 1 |
|---------|---------|
| <img src="https://raw.githubusercontent.com/avhan052-arch/TugasKelompok7_V0/main/assets/images/screenshot.jpg" width="250"/> | <img src="https://raw.githubusercontent.com/avhan052-arch/TugasKelompok7_V0/main/assets/images/screenshot1.jpg" width="250"/> |


> 📌 Simpan gambar Anda di folder `assets/images/` agar bisa muncul di README.  
> Gunakan perintah `git add assets/images/` lalu commit.

---

## ✨ Fitur Utama

- AppBar dengan judul **Kelompok 7**  
- Body menampilkan **daftar anggota** menggunakan `Card`  
- **Bottom Navigation Bar** (tanpa aksi tambahan, hanya tampilan)  
- Mendukung Android, iOS, Web, dan Desktop  

---

## ⚙️ Cara Instalasi & Menjalankan

### 1. Clone repository

```bash
git clone https://github.com/avhan052-arch/TugasKelompok7_V0.git
cd TugasKelompok7_V0
```
### 2. Pastikan Flutter sudah terpasang

Cek dengan:
```bash
flutter doctor
```
### 3. Install dependency
```bash
flutter pub get
```
### 4. Jalankan aplikasi
* Untuk Android (emulator/device):
```bash
flutter run
```
* Untuk Web:
```bash 
flutter run -d chrome
```
### 5. Build release 
* Android APK:
```bash
flutter build apk
```