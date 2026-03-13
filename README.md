Muhammad Rizky Febrianto | 2409116045
# 📱 Mini Project 1

## 📝 Deskripsi Aplikasi

Arkivee adalah aplikasi mobile berbasis Flutter untuk mengelola surat masuk dan surat keluar secara digital. Aplikasi ini memudahkan pengguna dalam mencatat, menyimpan, memperbarui, dan menghapus data surat tanpa perlu menggunakan arsip fisik. Dengan tampilan yang sederhana dan intuitif, Arkivee cocok digunakan untuk keperluan administrasi pribadi maupun organisasi kecil.

State management pada aplikasi ini menggunakan **GetX**, sehingga perubahan data langsung tercermin di tampilan tanpa perlu reload halaman secara manual.

---

## ✨ Fitur Aplikasi

- **Tambah Surat** — Menambahkan data surat baru dengan mengisi form yang tersedia
- **Lihat Daftar Surat** — Menampilkan semua surat yang tersimpan dalam bentuk list
- **Update Surat** — Mengedit data surat yang sudah ada
- **Hapus Surat** — Menghapus surat dari daftar penyimpanan
- **Statistik Surat** — Menampilkan jumlah total surat, surat masuk, dan surat keluar di halaman utama
- **Recently** — Menampilkan 4 surat yang paling baru ditambahkan di halaman utama
- **Pilih Tanggal** — Field tanggal menggunakan date picker kalender, bukan input manual
- **Validasi Nomor Surat** — Nomor surat yang sudah digunakan tidak bisa dipakai lagi selama masih tersimpan

---

## 🧩 Widget yang Digunakan

| Widget | Kegunaan |
|---|---|
| `GetMaterialApp`       | Root aplikasi dengan dukungan GetX |
| `Scaffold`             | Struktur dasar tiap halaman |
| `AppBar`               | Header halaman utama |
| `FloatingActionButton` | Tombol tambah surat |
| `Container`            | Membungkus elemen dengan dekorasi warna dan border radius |
| `SafeArea` | Menghindari konten tertutup status bar |
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `Expanded` | Mengisi sisa ruang yang tersedia |
| `ListView.builder` | Menampilkan daftar surat secara dinamis |
| `Card` | Tampilan kotak dengan bayangan untuk tiap surat dan input field |
| `ListTile` | Isi konten tiap kartu surat |
| `TextField` | Input teks untuk form surat |
| `DropdownButton` | Pilihan kategori surat (Masuk / Keluar) |
| `ElevatedButton` | Tombol simpan |
| `IconButton` | Tombol hapus dan tombol back |
| `TextButton` | Tombol "See All" di halaman utama |
| `SnackBar` (via `Get.snackbar`) | Notifikasi validasi form |
| `Obx` | Widget GetX untuk reaktif terhadap perubahan data |
| `showDatePicker` | Dialog kalender untuk memilih tanggal surat |
| `BoxDecoration` | Dekorasi container (warna, border radius) |
| `BorderRadius` | Mengatur sudut melengkung pada container |
| `SingleChildScrollView` | Membuat form bisa di-scroll |
| `SizedBox` | Memberi jarak antar widget |
| `Padding` | Memberi jarak di dalam widget |
| `Center` | Memusatkan widget |
| `Text` | Menampilkan teks |
| `Icon` | Ikon pada tombol |

---

## 🖼️ Tampilan Aplikasi & Penjelasannya
<table>
  <tr>
    <th>Home Page</th>
    <th>Create A Letter</th>
  </tr>  
  <tr>
    <td><img width="312" height="672" alt="image" src="https://github.com/user-attachments/assets/a6af862e-64a5-4b04-ada1-8a145eb7e251" /></td>
    <td><img width="310" height="671" alt="image" src="https://github.com/user-attachments/assets/5c8bafaf-b8b7-4724-9e58-ff5bfe5701c9" /></td>
  </tr>
  <tr>
    <td>
        Halaman utama aplikasi. Di bagian atas terdapat kotak biru yang menampilkan statistik surat: jumlah surat masuk, surat keluar, dan total surat. Di bawahnya ada section "Recently" yang akan menampilkan 4 surat             terbaru, serta tombol *See All* untuk melihat semua surat. Tombol "+" di pojok kanan bawah digunakan untuk menambah surat baru.
    </td>
    <td>
        Halaman untuk menambahkan surat baru. Terdapat 5 field yang harus diisi: Nomor Surat, Perihal, Tanggal Surat (dengan ikon kalender untuk memilih tanggal), Asal/Tujuan, dan Kategori Surat (dropdown Masuk/Keluar).          Di bagian bawah ada tombol "Simpan" untuk menyimpan data. Tombol "←" di pojok kiri atas untuk kembali ke halaman sebelumnya.
    </td>
  </tr>
  <tr>
    <th>Your Letter (List Surat)</th>
    <th>Update A Letter</th>
  </tr>
  <tr>
    <td><img width="311" height="673" alt="image" src="https://github.com/user-attachments/assets/88f836c1-eb75-4c91-ab4b-3ae254edc16b" /></td>
    <td><img width="309" height="673" alt="image" src="https://github.com/user-attachments/assets/c4f2d283-8115-49e1-8343-3f3a186e7cc7" /></td>
  </tr>
  <tr>
    <td>
      Halaman daftar semua surat yang tersimpan. Setiap surat ditampilkan dalam bentuk kartu berisi: Perihal (judul), Nomor, Tanggal, Kategori, dan Asal/Tujuan. Terdapat ikon 🗑️ merah di sisi kanan untuk menghapus             surat. Jika kartu ditekan, akan masuk ke halaman Update.
    </td>
    <td>
      Halaman untuk mengedit data surat yang sudah ada. Form-nya sama seperti Create, namun field sudah terisi dengan data lama sehingga pengguna tinggal mengubah bagian yang diperlukan saja. Setelah selesai, tekan             "Simpan" untuk menyimpan perubahan.
    </td>
  </tr>
</table>

---

# 🚀 Mini Project 2
Pada Mini Project 2, aplikasi Arkivee dikembangkan lebih lanjut dengan menambahkan beberapa fitur dan sudah terintegrasi dengan database menggunakan supabase

---

## ✨ Fitur Tambahan

- **CRUD Surat yang Terintegrasi Database Supabase** — Setiap surat disimpan dengan `user_id`, sehingga setiap pengguna hanya bisa melihat surat miliknya sendiri.
- **Validasi CRUD** — Setelah melakukan Create, Update, dan Delete akan menampilkan notifikasi validasi dari aksi yang dilakukan.
- **Register Akun** — Pengguna dapat membuat akun baru menggunakan email dan password sebelum menggunakan aplikasi
- **Login Akun** — Pengguna dapat masuk ke aplikasi menggunakan akun yang sudah terdaftar
- **Validasi Form Login & Register** — Input email dan password divalidasi untuk memastikan format yang benar sebelum diproses
- **Autentikasi Supabase** — Sistem login dan register terhubung langsung dengan Supabase Authentication sehingga akun tersimpan secara online
- **Search Surat** — Pengguna dapat mencari surat berdasarkan **nomor surat** atau **perihal surat**
- **Filter Surat** — Surat dapat difilter berdasarkan kategori **Semua Surat, Surat Masuk, atau Surat Keluar**
- **Sorting Surat** — Daftar surat dapat diurutkan berdasarkan tanggal **Terbaru** atau **Terlama**
- **Light Mode & Dark Mode** — Pengguna dapat mengganti tampilan aplikasi antara mode terang dan mode gelap

---

## 🧩 Widget Tambahan

| Widget                             | Kegunaan                                                                           |
| ---------------------------------- | ---------------------------------------------------------------------------------- |
| `TextFormField`                    | Input form dengan sistem validasi (digunakan pada login, register, dan form surat) |
| `Form`                             | Membungkus beberapa field input agar bisa divalidasi sekaligus                     |
| `GlobalKey<FormState>`             | Mengontrol dan menjalankan validasi pada form                                      |
| `DropdownButtonFormField`          | Dropdown dengan dukungan validasi form                                             |
| `CircularProgressIndicator`        | Menampilkan indikator loading saat proses login atau register                      |
| `InkWell`                          | Membuat kartu surat dapat ditekan (tap interaction)                                |
| `LinearGradient`                   | Memberi efek gradasi warna pada container statistik di halaman Home                |
| `TextEditingController`            | Mengontrol dan mengambil nilai dari input field                                    |
| `Navigator`                        | Digunakan untuk navigasi kembali pada komponen header halaman                      |
| `showDialog` / `Get.defaultDialog` | Menampilkan dialog konfirmasi seperti saat menghapus surat                         |
| `Icon` (visibility toggle)         | Mengubah tampilan password menjadi visible / hidden pada form login dan register   |

---

## 🖼️ Tampilan Aplikasi Tambahan/Terbaru & Penjelasannya
<table>
  <tr>
    <th>Login Page</th>
    <th>Register Page</th>
  </tr>  
  <tr>
    <td><img width="311" height="668" alt="image" src="https://github.com/user-attachments/assets/fe348992-d42d-4641-b99f-593d02bedc87" /></td>
    <td><img width="308" height="665" alt="image" src="https://github.com/user-attachments/assets/397aef40-5c0e-4f86-ab1b-6fd10f5c2e08" /></td>
  </tr>
  <tr>
    <td>
        Pada halaman ini pengguna diminta untuk memasukkan email dan password yang sudah terdaftar untuk dapat mengakses aplikasi. Terdapat ikon visibility pada field password untuk menampilkan atau menyembunyikan                 password yang dimasukkan. Jika pengguna belum memiliki akun, tersedia tombol Register yang akan mengarahkan ke halaman pembuatan akun.
    </td>
    <td>
        Halaman Register digunakan untuk membuat akun baru sebelum menggunakan aplikasi. Pengguna harus mengisi email, password, dan confirm password untuk memastikan password yang dimasukkan benar. Setelah proses                registrasi berhasil, pengguna akan diarahkan kembali ke halaman login untuk masuk ke aplikasi menggunakan akun yang telah dibuat.
    </td>
  </tr>
  <tr>
    <th>Home Page</th>
    <th>Your Letter (List Surat)</th>
  </tr>
  <tr>
    <td><img width="312" height="670" alt="image" src="https://github.com/user-attachments/assets/7ac78dc4-5703-4929-b4dc-7f6bccd16139" /></td>
    <td><img width="309" height="671" alt="image" src="https://github.com/user-attachments/assets/351fefa0-d4ce-42d4-870c-a97ff74e1cc4" /></td>
  </tr>
  <tr>
    <td>
      Pada bagian kanan atas halaman terdapat tombol Dark Mode / Light Mode yang dapat digunakan untuk mengganti tema tampilan aplikasi sesuai preferensi pengguna. Selain itu juga terdapat tombol Logout yang memungkinkan        pengguna keluar dari akun dan kembali ke halaman login.
    </td>
    <td>
      Pada bagian atas terdapat kolom pencarian yang memungkinkan pengguna mencari surat berdasarkan nomor atau perihal. Selain itu tersedia fitur filter kategori untuk menampilkan surat masuk atau keluar saja, serta           fitur sorting untuk mengurutkan surat berdasarkan tanggal terbaru atau terlama. Setiap surat ditampilkan dalam bentuk kartu yang memuat informasi singkat dan dilengkapi dengan tombol edit dan hapus.
    </td>
  </tr>
</table>
