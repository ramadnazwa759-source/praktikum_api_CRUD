# Praktikum: Pengenalan Implementasi Dasar API Eksternal (CRUD & Styling)

### Nama : Nazwa Ridev Ramadhani
### Nim : 362458302068
### Kelas : 2B TRPL


## A. Tujuan Praktikum
Pada Praktikum ini bertujuan untuk mengimplementasikan konsep API (Application Programming Interface) dengan menggunakan package Http untuk melakukan operasi CRUD (Create, Read, Update, Delete) terhadap data dari API eksternal dengan memahami konsep alur.

---

## B. Dasar Teori
### API (Application Programming Interface)
API adalah antarmuka yang menghubungkan dua sistem perangkat lunak agar dapat saling berkomunikasi. Dalam konteks Flutter, API digunakan untuk mengambil atau mengirim data dari/ke server.

### REST API
REST (Representational State Transfer) adalah standar komunikasi antara client dan server menggunakan protokol HTTP.
1. GET untuk mengambil data dari server
2. POST untuk menambahkan data baru
3. PUT untuk memperbarui data yang sudah ada
4. DELETE untuk menghapus data

### JSON (JavaScript Object Notation)
Format pertukaran data berbasis teks yang ringan dan mudah dibaca.

## Langkah-langkah implementasi (disertai screenshot hasil setiap bagian penting).
### 1. Langkah 1 Setup Proyek :
- Buat project Flutter baru dengan tambahkan dependency http di pubspec.yaml, lalu jalankan flutter pub get.
<img width="574" height="118" alt="image" src="https://github.com/user-attachments/assets/2b42530b-e565-46c2-9372-335a9c002431" />

### Langkah 2 
#### Model Data : Buat file user_model.dart untuk menampung struktur data pengguna dari API.
#### Service API : Buat api_service.dart berisi fungsi fetchUsers 
#### Main.dart menampilkan daftar pengguna sebelum menambahkan beberapa method pada Service API
<img width="540" height="1170" alt="image" src="https://github.com/user-attachments/assets/33186cd9-1532-49a7-867c-e398a6d1e293" />

### Langkah 3 Tambah & Edit Data
#### Buat File AddUserPage untuk menambah user baru.
#### Buat File EditUserPage untuk memperbarui data user yang dikirim dari halaman utama.

#### Menambahkan Method createUser, updateUser, dan deleteUser di File api_service.dart
#### Hasil Tampilan 
<img width="540" height="1170" alt="image" src="https://github.com/user-attachments/assets/7c68ae24-da34-4247-89aa-de8c1d3a0c6f" />

#### Hasil Method Create
![WhatsApp Image 2025-10-28 at 06 20 09 (1)](https://github.com/user-attachments/assets/9eae6e66-c0e1-4d30-9903-a3f2ae2838f7)

#### Hasil Method Update
![WhatsApp Image 2025-10-28 at 06 20 09 (2)](https://github.com/user-attachments/assets/d8f90054-3cdf-44f8-96d0-cb3e51e04ba6)

#### Hasil Method Delete
![WhatsApp Image 2025-10-28 at 06 20 10](https://github.com/user-attachments/assets/806c53bf-905b-40e6-b94b-1c760ca86919)

#### Menambahkan Fungsi File api_config.dart
File api_config.dart ditambahkan karena sebelum menambahkan file ini, Halaman tidak dapat melakukan operasi CRUD seperti mengubah, menambah, dan menghapus data melalui API.

## Analisis Kode (jelaskan bagian-bagian penting dari kode Anda).
#### Analisis Kode Modifikasi pada onTap di widget Listview dalam UserListPage di main.dart, yang berfungsi untuk berpindah ke halaman EditUserPage sekaligus mengirimkan data User yang dipilih.
<img width="749" height="375" alt="image" src="https://github.com/user-attachments/assets/f3718cb1-4daa-4ed0-af21-6b5a71b66c5b" />

- Navigator.push() untuk berpindah ke halaman EditUserPage dan mengirim data User yang dipilih.
- .then((value) untuk menjalankan setelah halaman edit ditutup.
- _refreshUserList() untuk memanggil ulang data dari API agar tampilan daftar user langsung ter-update.

#### Analisis Kode api_config.dart
<img width="701" height="139" alt="image" src="https://github.com/user-attachments/assets/58329330-22d6-4343-b423-bf0fbd3585c7" />

- baseUrl untuk Menyimpan alamat utama API yang digunakan untuk operasi CRUD.
- apiKey untuk Digunakan sebagai kunci akses ke API (jika diperlukan).
  
## Kesimpulan dan Saran.
Kesimpulan praktikum ini dapat mempelajari API eksternal dengan menggunakan package http dan melakukan praktikum dengan operasi CRUD (Create, Read, Update, Delete).
Menampilkan Tampilan halaman yang bisa melakukan perintah seperti menampilkan, menambah, mengedit, dan menghapus data pengguna serta memperbarui tampilan secara otomatis tanpa perlu memuat ulang halaman.
