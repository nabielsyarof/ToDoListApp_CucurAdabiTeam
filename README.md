# 📝 To-Do Activity App

## 👥 Anggota Tim
| Nama Lengkap | NIM |
|---------------|-----|
| Achmad Varis Abdussalam | 2310130001 |
| Nabiel Syarof Azzaky | 2310130012 |
| Muhammad Naufal Ammr Dzakwan | 2310130010 |
| Muhammad Irfan Janur | 2310130009 |

---

## 🎯 Tema Aplikasi
**To-Do Activity App** — Aplikasi sederhana untuk mencatat dan mengelola daftar kegiatan harian pengguna.

---

## 📋 Deskripsi Singkat
Aplikasi ini digunakan untuk mencatat aktivitas harian pengguna seperti *Belajar Flutter, Olahraga, Baca Buku,* dan lain-lain.  
Pengguna dapat **menambah** dan **menghapus** aktivitas secara interaktif melalui tampilan yang sederhana dan responsif.  
Data disimpan sementara di dalam memori menggunakan struktur **List di Dart**, sehingga setiap perubahan langsung diperbarui di layar.

---

## 👩‍💻 Pembagian Tugas
| Anggota | Tugas Utama |
|----------|--------------|
| **Achmad Varis Abdussalam** | Membuat tampilan daftar kegiatan, animasi item, dan tombol tambah (FloatingActionButton). |
| **Nabiel Syarof Azzaky** | Mendesain struktur kode utama, pengaturan layout, dan tampilan antarmuka aplikasi. |
| **Muhammad Naufal Ammr Dzakwan** | Mengembangkan logika input dan fungsi dialog tambah kegiatan (`_showAddDialog()`). |
| **Muhammad Irfan Janur** | Menangani fitur penghapusan data, pengujian fungsi aplikasi, serta pembuatan dokumentasi. |

---

## 🖼️ Screenshot
1. Tampilan utama daftar kegiatan  
2. Dialog untuk menambah kegiatan baru  

*(Tambahkan gambar di sini jika sudah tersedia)*

---

## 💡 Penjelasan Teknis
- Data kegiatan disimpan dalam:  
  ```dart
  List<String> _activities;
