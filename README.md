# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Tugas 7
1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!
   Widget tree adalah susunan widget dalam aplikasi Flutter yang saling terhubung dan membentuk tampilan aplikasi. Di Flutter, hampir semua bagian tampilan dibuat menggunakan widget, mulai dari halaman, teks, ikon, tombol, sampai pengaturan jarak. Widget-widget tersebut disusun secara bertingkat, seperti sebuah pohon yang memiliki induk dan anak.

   Hubungan parent-child terjadi ketika sebuah widget menjadi wadah bagi widget lainnya. Widget induk (parent) bertugas mengatur widget anak (child) yang ada di dalamnya. Misalnya, `Column` bisa digunakan untuk menyusun beberapa widget dari atas ke bawah, sedangkan `Row` digunakan untuk menyusunnya dari kiri ke kanan. Jadi, posisi dan tampilan sebuah widget juga bisa dipengaruhi oleh widget yang membungkusnya.

   Pada proyek MyPortfolio Mobile, susunan widget dimulai dari `MyApp` yang mengembalikan `MaterialApp`. Di dalam `MaterialApp`, terdapat `MyHomePage` sebagai halaman utama aplikasi. Selanjutnya, `MyHomePage` menggunakan `Scaffold` sebagai kerangka halaman yang memiliki bagian `AppBar` dan `body`.

   Gambaran sederhana widget tree pada aplikasi saya seperti berikut:
   MyApp
   └── MaterialApp
       └── MyHomePage
           └── Scaffold
               ├── AppBar
               │   └── Text
               │
               └── Body
                   └── SingleChildScrollView
                       └── Padding
                           └── Column
                               ├── Row
                               │   ├── InfoCard (NPM)
                               │   ├── InfoCard (Name)
                               │   └── InfoCard (Class)
                               │
                               └── Center
                                   └── Column
                                       ├── Padding
                                       │   └── Text
                                       ├── GridView.count
                                       │   ├── ItemCard (Lihat Proyek)
                                       │   ├── ItemCard (Tambah Proyek)
                                       │   ├── ItemCard (Lihat Education)
                                       │   └── ItemCard (Tambah Education)
                                       └── SizedBox
                                           └── ItemCard (Logout)

   Dari struktur tersebut, bisa dilihat bahwa setiap widget punya perannya masing-masing. Contohnya, `Row` menjadi induk bagi tiga `InfoCard` agar informasi NPM, Name, dan Class bisa ditampilkan berdampingan. Sementara itu, empat menu pertama ditempatkan di dalam `GridView.count` supaya tersusun menjadi dua kolom.

   Untuk tombol Logout, saya meletakkannya secara terpisah di dalam `SizedBox`, bukan di dalam grid yang sama dengan empat tombol lainnya. Susunan ini membuat posisi Logout bisa diatur sendiri.

   Saya juga menggunakan `SingleChildScrollView` untuk membungkus konten halaman agar bisa digulir jika seluruh tampilannya tidak muat di layar. Hal ini membantu mengatasi masalah overflow yang sebelumnya muncul ketika aplikasi dijalankan di Chrome.

   Menurut saya, memahami widget tree cukup penting saat membuat aplikasi Flutter. Ketika tampilan tidak sesuai harapan, kita bisa melihat kembali susunan widget-nya dan mencari tahu bagian mana yang perlu diperbaiki. Jadi, kita tidak asal mengubah kode tanpa mengetahui pengaruhnya terhadap widget lain.


2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!
   Dalam proyek MyPortfolio Mobile, saya menggunakan beberapa widget bawaan Flutter dan juga membuat custom widget sendiri. Widget-widget tersebut digunakan untuk menyusun halaman utama, menampilkan informasi profil, dan membuat menu yang bisa ditekan.

   Berikut widget yang saya gunakan beserta fungsinya:
   a. `MaterialApp`
   Widget ini menjadi pembungkus utama aplikasi. Di dalamnya saya mengatur judul aplikasi, tema warna, dan halaman pertama yang akan ditampilkan. Pada proyek ini, `MaterialApp` mengarahkan pengguna ke halaman `MyHomePage`.

   b. `Scaffold`
   `Scaffold` digunakan sebagai kerangka dasar halaman. Di dalamnya terdapat bagian seperti `AppBar` dan `body`. Saya menggunakannya supaya struktur halaman utama MyPortfolio Mobile lebih teratur.

   c. `AppBar`
   Widget ini digunakan untuk menampilkan bagian atas halaman. Pada aplikasi saya, `AppBar` menampilkan tulisan "MyPortfolio" dengan warna latar yang mengikuti warna utama dari tema aplikasi.

   d. `Text`
   `Text` digunakan untuk menampilkan tulisan. Contohnya adalah judul aplikasi, pesan sambutan, informasi NPM, nama, kelas, dan nama pada setiap tombol menu.

   e. `SingleChildScrollView`
   Widget ini membuat konten di dalamnya bisa digulir ketika ukurannya lebih panjang daripada area layar. Saya menggunakannya untuk membungkus bagian utama halaman supaya seluruh konten tetap bisa dilihat dan tidak mengalami overflow.

   f. `Padding`
   `Padding` berfungsi memberikan jarak di sekitar widget. Pada aplikasi saya, widget ini digunakan untuk mengatur jarak konten dari tepi layar, memberi ruang pada teks sambutan, dan mengatur jarak di dalam kartu menu.

   g. `Column`
   `Column` digunakan untuk menyusun beberapa widget secara vertikal atau dari atas ke bawah. Saya menggunakannya untuk menyusun bagian-bagian halaman utama, termasuk ikon dan teks yang ada di dalam kartu menu.

   h. `Row`
   `Row` digunakan untuk menyusun widget secara horizontal atau dari kiri ke kanan. Pada proyek ini, `Row` digunakan untuk menampilkan tiga kartu informasi, yaitu NPM, Name, dan Class, secara berdampingan.

   i. `Center`
   `Center` digunakan untuk menempatkan widget di bagian tengah area yang tersedia. Pada aplikasi saya, widget ini membantu memosisikan bagian sambutan dan kumpulan menu agar berada di tengah halaman.

   j. `SizedBox`
   `SizedBox` digunakan untuk mengatur ukuran widget atau memberikan jarak kosong. Pada proyek ini, saya menggunakannya untuk memberi jarak antarbagian tampilan dan mengatur ukuran kartu Logout menjadi lebar 150 piksel dan tinggi 90 piksel.

   k. `GridView.count`
   Widget ini digunakan untuk menampilkan beberapa widget dalam bentuk grid atau kisi dengan jumlah kolom yang bisa ditentukan. Saya menggunakannya untuk menyusun empat menu pertama, yaitu Lihat Proyek, Tambah Proyek, Lihat Education, dan Tambah Education, dalam dua kolom.

   Saya juga menggunakan `shrinkWrap` agar ukuran grid menyesuaikan kontennya dan `NeverScrollableScrollPhysics` agar grid tidak memiliki pengguliran sendiri. Dengan begitu, pengguliran halaman cukup ditangani oleh `SingleChildScrollView`.

   l. `Card`
   `Card` digunakan untuk menampilkan konten dalam bentuk kartu. Pada proyek saya, widget ini digunakan di dalam `InfoCard` untuk membungkus informasi NPM, Name, dan Class agar tampilannya lebih rapi dan mudah dibedakan.

   m. `Container`
   `Container` digunakan sebagai wadah untuk mengatur tampilan widget di dalamnya. Pada `InfoCard`, widget ini membantu mengatur ukuran dan jarak isi kartu. Sementara pada `ItemCard`, `Container` digunakan untuk mengatur jarak antara isi kartu dan bagian tepinya.

   n. `Icon`
   `Icon` digunakan untuk menampilkan ikon pada setiap menu. Contohnya, ikon folder untuk Lihat Proyek, ikon tambah untuk Tambah Proyek, ikon sekolah untuk Lihat Education, ikon penambahan untuk Tambah Education, dan ikon logout untuk Logout.

   o. `Material`
   `Material` digunakan untuk memberikan tampilan dengan dasar Material Design. Pada `ItemCard`, widget ini digunakan untuk mengatur warna latar kartu berdasarkan data warna yang diberikan dan membuat sudut kartu menjadi melengkung menggunakan `BorderRadius`.

   p. `InkWell`
   `InkWell` membuat suatu bagian tampilan bisa menerima interaksi seperti sentuhan atau klik. Saya menggunakannya di dalam `ItemCard`, sehingga setiap kartu menu bisa ditekan. Ketika pengguna menekan kartu, fungsi `onTap` akan dijalankan dan menampilkan `SnackBar`.

   q. `SnackBar`
   `SnackBar` digunakan untuk menampilkan pesan singkat di bagian bawah layar. Pada aplikasi saya, pesan ini muncul ketika pengguna menekan salah satu menu. Isi pesannya menyesuaikan nama tombol, contohnya "Kamu telah menekan tombol Lihat Proyek!".

   Selain widget bawaan Flutter, saya juga membuat beberapa custom widget sendiri:

   r. `MyApp`
   `MyApp` merupakan custom widget yang menggunakan `StatelessWidget`. Tugasnya adalah mengatur konfigurasi awal aplikasi melalui `MaterialApp`, seperti judul, tema, dan halaman utama.

   s. `MyHomePage`
   `MyHomePage` juga menggunakan `StatelessWidget`. Widget ini berisi tampilan utama MyPortfolio Mobile, mulai dari tiga kartu informasi profil, teks sambutan, sampai lima menu aksi.

   t. `InfoCard`
   `InfoCard` adalah custom widget yang saya buat untuk menampilkan informasi profil dalam bentuk kartu. Widget ini menerima dua parameter, yaitu `title` dan `content`. Dengan cara ini, saya bisa menggunakan struktur kartu yang sama untuk menampilkan NPM, Name, dan Class tanpa harus menulis kode yang sama berulang kali.

   u. `ItemCard`
   `ItemCard` adalah custom widget untuk menampilkan menu aksi dalam bentuk kartu yang bisa ditekan. Widget ini menerima objek `ItemHomepage`, kemudian menggunakan data nama, ikon, dan warna untuk membentuk tampilan kartu. Ketika ditekan, kartu akan menampilkan `SnackBar` sesuai dengan nama menu tersebut.

   Selain itu, saya juga membuat class `ItemHomepage` sebagai tempat menyimpan data setiap menu. Class ini memiliki tiga atribut, yaitu `name`, `icon`, dan `color`. Perlu diperhatikan bahwa `ItemHomepage` bukan widget, melainkan class yang berfungsi sebagai model data untuk memberikan informasi kepada `ItemCard`.

   Ada juga beberapa komponen dan fungsi Flutter yang membantu proses pembuatan tampilan, seperti `ThemeData`, `ColorScheme.fromSeed`, `Theme.of(context)`, `MediaQuery.of(context)`, dan `ScaffoldMessenger.of(context)`. Komponen tersebut membantu mengatur tema, menyesuaikan tampilan dengan ukuran layar, dan menampilkan `SnackBar`, tetapi bukan custom widget yang saya buat sendiri.

   Dari pengerjaan ini, saya jadi lebih memahami bahwa membuat custom widget bisa membantu mengurangi penulisan kode yang berulang. Misalnya, saya cukup membuat satu `InfoCard`, lalu menggunakannya kembali untuk tiga informasi profil yang berbeda. Hal yang sama juga berlaku pada `ItemCard` untuk kelima menu aksi.


3. Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!
   `MaterialApp` merupakan widget yang digunakan untuk mengatur konfigurasi utama aplikasi Flutter yang menggunakan Material Design. Biasanya, widget ini ditempatkan sebagai root widget, yaitu widget paling atas yang membungkus struktur utama aplikasi.

   Ada beberapa hal yang bisa diatur melalui `MaterialApp`, seperti tema aplikasi, halaman awal, judul, dan navigasi antarhalaman. Jadi, widget ini bukan hanya berfungsi untuk menampilkan halaman, tetapi juga menjadi tempat untuk mengatur berbagai konfigurasi yang digunakan oleh aplikasi.

   Pada proyek MyPortfolio Mobile, saya menggunakan `MaterialApp` di dalam class `MyApp`. Kode yang saya gunakan adalah:
   ```dart
   return MaterialApp(
     title: 'MyPortfolio',
     theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(
         seedColor: Colors.indigo,
         secondary: Colors.amber[700],
       ),
       useMaterial3: true,
     ),
     home: MyHomePage(),
   );
   ```

   Dari kode tersebut, properti `title` digunakan untuk memberikan judul aplikasi, yaitu "MyPortfolio". Kemudian, bagian `theme` digunakan untuk mengatur tema tampilan melalui `ThemeData`.

   Saya menggunakan `ColorScheme.fromSeed` dengan warna dasar indigo dan warna sekunder amber. Tujuannya agar aplikasi memiliki skema warna yang konsisten. Selain itu, `useMaterial3: true` digunakan untuk mengaktifkan Material Design 3.

   Bagian `home: MyHomePage()` menentukan halaman yang pertama kali ditampilkan ketika aplikasi dijalankan. Jadi, pengguna akan langsung masuk ke halaman utama MyPortfolio Mobile.

   `MaterialApp` biasanya digunakan sebagai root widget karena konfigurasi utama aplikasi perlu tersedia untuk widget-widget yang ada di bawahnya. Contohnya, pada `MyHomePage`, saya bisa mengambil warna utama dari tema aplikasi menggunakan `Theme.of(context)`.

   Contoh penggunaannya ada pada bagian `AppBar`:
   backgroundColor: Theme.of(context).colorScheme.primary,

   Kode tersebut mengambil warna utama dari tema yang sudah diatur di `MaterialApp`, lalu menggunakannya sebagai warna latar `AppBar`.

   Menurut saya, penggunaan `MaterialApp` sebagai root widget membuat pengaturan aplikasi lebih praktis. Saya tidak perlu menentukan konfigurasi tema secara terpisah di setiap bagian karena pengaturan utamanya sudah tersedia di satu tempat dan bisa digunakan oleh widget lain.


4. Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`?
   `StatelessWidget` dan `StatefulWidget` merupakan dua jenis widget yang sering digunakan dalam Flutter. Perbedaan utamanya ada pada apakah widget tersebut perlu mengelola state atau kondisi yang bisa berubah selama aplikasi berjalan.

   `StatelessWidget` adalah widget yang tidak memiliki state internal yang berubah-ubah. Tampilan widget ini dibuat berdasarkan data atau konfigurasi yang diterima. Contohnya adalah widget yang hanya menampilkan judul, teks, informasi profil, atau kartu dengan data yang sudah ditentukan.

   Sementara itu, `StatefulWidget` digunakan ketika sebuah widget perlu menyimpan dan mengubah kondisi tertentu selama aplikasi berjalan. Perubahan tersebut bisa terjadi karena interaksi pengguna atau perubahan data. Untuk mengelola perubahan state, Flutter menyediakan class `State` dan metode `setState()`.

   Contoh sederhananya adalah aplikasi penghitung angka. Ketika pengguna menekan tombol tambah, angka yang ditampilkan akan berubah. Karena nilai penghitung harus disimpan dan diperbarui, penggunaan `StatefulWidget` lebih cocok untuk kasus tersebut.

   Perbedaan keduanya bisa dilihat dari beberapa hal berikut:
   - `StatelessWidget` tidak memiliki state internal yang dikelola melalui class `State`, sedangkan `StatefulWidget` memiliki class `State`.
   - `StatelessWidget` membangun tampilan berdasarkan konfigurasi atau data yang diterima, sedangkan `StatefulWidget` bisa memperbarui tampilannya ketika state berubah.
   - Struktur `StatelessWidget` lebih sederhana karena hanya membutuhkan class widget, sedangkan `StatefulWidget` memiliki class widget dan class state.
   - `StatelessWidget` cocok untuk tampilan yang tidak perlu mengelola perubahan state internal, sedangkan `StatefulWidget` cocok untuk komponen yang kondisinya bisa berubah selama aplikasi berjalan.

   Pada proyek MyPortfolio Mobile, saya menggunakan `StatelessWidget` untuk `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard`. Alasannya, komponen-komponen tersebut hanya bertugas menampilkan tampilan berdasarkan data yang sudah disediakan.

   Contohnya, `MyHomePage` menampilkan informasi NPM, Name, dan Class serta lima menu yang sudah ditentukan. Kemudian, `InfoCard` menerima data `title` dan `content`, sedangkan `ItemCard` menerima objek `ItemHomepage` yang berisi nama, ikon, dan warna kartu.

   Meskipun `ItemCard` bisa ditekan dan menampilkan `SnackBar`, bukan berarti widget tersebut harus menggunakan `StatefulWidget`. Hal ini karena ketika tombol ditekan, aplikasi hanya menjalankan fungsi `onTap` untuk menampilkan pesan sementara. Tidak ada state internal pada kartu yang perlu disimpan atau diubah.

   Jadi, pemilihan kedua jenis widget ini perlu disesuaikan dengan kebutuhan. Kalau widget hanya digunakan untuk menampilkan informasi atau tampilan berdasarkan data yang sudah tersedia, `StatelessWidget` sudah cukup. Namun, kalau widget perlu menyimpan dan memperbarui kondisi tertentu, seperti angka penghitung atau status pilihan, kita bisa menggunakan `StatefulWidget`.


5. Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode `build`?
   `BuildContext` adalah objek yang menunjukkan posisi suatu widget di dalam widget tree. Sederhananya, `BuildContext` membantu widget mengetahui letaknya dalam struktur aplikasi sehingga bisa mengakses informasi atau layanan yang tersedia dari widget lain di sekitarnya.

   `BuildContext` penting karena ada banyak fitur Flutter yang membutuhkan informasi dari lingkungan tempat widget berada. Contohnya, kita bisa menggunakannya untuk mengambil tema aplikasi, mengetahui ukuran layar, atau mengakses fasilitas untuk menampilkan `SnackBar`.

   Di dalam Flutter, metode `build` memiliki parameter `BuildContext context`. Parameter inilah yang bisa digunakan ketika kita ingin mengambil informasi atau menggunakan fitur tertentu saat membangun tampilan.

   Pada proyek MyPortfolio Mobile, saya menggunakan `BuildContext` dalam beberapa bagian berikut.
   a. Mengambil warna dari tema aplikasi
   ```dart
   backgroundColor: Theme.of(context).colorScheme.primary,
   ```

   Kode tersebut digunakan untuk mengambil warna utama yang sudah diatur melalui `MaterialApp`. Warna tersebut kemudian digunakan sebagai latar `AppBar`.
   Jadi, saya tidak perlu menentukan warna utama secara manual di bagian `AppBar`, karena warnanya bisa langsung mengikuti tema aplikasi.

   b. Menyesuaikan ukuran kartu dengan layar
   ```dart
   MediaQuery.of(context).size.width
   ```

   `MediaQuery.of(context)` digunakan untuk mengambil informasi ukuran layar, salah satunya lebar layar yang tersedia. Pada proyek saya, informasi ini digunakan untuk menentukan lebar kartu informasi agar ukurannya bisa menyesuaikan dengan perangkat yang digunakan.

   c. Menampilkan pesan `SnackBar`
   ```dart
   ScaffoldMessenger.of(context)
     ..hideCurrentSnackBar()
     ..showSnackBar(
       SnackBar(
         content: Text("Kamu telah menekan tombol ${item.name}!"),
       ),
     );
   ```

   Pada bagian ini, `ScaffoldMessenger.of(context)` digunakan untuk mengakses fasilitas `ScaffoldMessenger` melalui `BuildContext`. Kemudian, `hideCurrentSnackBar()` digunakan untuk menyembunyikan pesan sebelumnya jika masih tampil, sedangkan `showSnackBar()` digunakan untuk menampilkan pesan baru sesuai dengan nama tombol yang ditekan.

   Dari contoh tersebut, saya jadi memahami bahwa `BuildContext` bukan hanya parameter yang ditulis di dalam metode `build`, tetapi juga membantu widget mengakses informasi yang dibutuhkan dari struktur aplikasi.

   Hal yang perlu diperhatikan adalah posisi `BuildContext` di dalam widget tree. Sebuah widget harus memiliki konteks yang tepat agar bisa mengakses tema atau layanan yang tersedia pada bagian atas struktur widget-nya.

   Dalam proyek ini, `BuildContext` membantu saya mengambil warna tema, menyesuaikan ukuran tampilan, dan menampilkan pesan ketika pengguna menekan menu. Jadi, penggunaannya cukup penting dalam proses membangun tampilan dan menambahkan interaksi pada aplikasi Flutter.


6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?
   Hot reload adalah fitur Flutter yang memungkinkan kita melihat perubahan kode secara langsung tanpa harus menghentikan dan menjalankan ulang aplikasi dari awal. Fitur ini sangat membantu ketika sedang mengembangkan tampilan karena kita bisa mengubah kode, lalu melihat hasilnya dengan lebih cepat.

   Salah satu kelebihan hot reload adalah state aplikasi yang sedang berjalan biasanya tetap dipertahankan. Jadi, kita tidak perlu mengulang semua proses dari awal hanya karena mengubah bagian tertentu dari kode.

   Contohnya saat mengerjakan MyPortfolio Mobile, saya bisa mengubah warna tombol, ukuran kartu, jarak antarkomponen, atau susunan widget. Setelah melakukan perubahan, saya bisa menggunakan hot reload untuk melihat hasilnya tanpa harus menjalankan ulang aplikasi.

   Berbeda dengan hot reload, hot restart akan menjalankan ulang aplikasi Flutter menggunakan kode terbaru. Karena aplikasi dimulai kembali, state sementara yang sebelumnya tersimpan akan direset.

   Sementara itu, full restart dilakukan dengan menghentikan aplikasi yang sedang berjalan, lalu menjalankannya kembali secara penuh. Proses ini biasanya diperlukan ketika perubahan yang dilakukan tidak cukup diterapkan melalui hot reload atau hot restart, misalnya perubahan pada kode native atau konfigurasi platform.

   Perbedaan ketiganya adalah:
   - Hot reload: Memperbarui perubahan kode tanpa menghilangkan state aplikasi yang sedang berjalan. Cocok untuk perubahan tampilan atau kode yang tidak membutuhkan proses inisialisasi ulang.
   - Hot restart: Menjalankan ulang aplikasi Flutter menggunakan kode terbaru dan mereset state sementara aplikasi.
   - Full restart: Menghentikan dan menjalankan kembali aplikasi secara penuh agar perubahan yang tidak bisa diterapkan melalui hot reload atau hot restart dapat digunakan.

   Ada beberapa kondisi ketika kita tidak bisa hanya mengandalkan hot reload, misalnya:
   a. Ketika mengubah fungsi `main()` atau proses awal aplikasi. Hot reload tidak menjalankan ulang fungsi `main()`, sehingga perubahan pada bagian tersebut bisa memerlukan hot restart.

   b. Ketika mengubah proses inisialisasi state, seperti kode di dalam metode `initState()`. Karena hot reload tidak menjalankan ulang `initState()`, kita mungkin perlu melakukan hot restart agar proses inisialisasi dijalankan kembali.

   c. Ketika ingin menguji aplikasi dari kondisi awal. Hot reload mempertahankan state yang sedang berjalan, sedangkan hot restart akan mengatur ulang kondisi aplikasi.

   d. Ketika mengubah kode native atau konfigurasi platform, seperti bagian Android atau iOS, maupun ketika menambahkan plugin yang membutuhkan integrasi native. Perubahan seperti ini bisa membutuhkan full restart dan proses build ulang agar dapat diterapkan.

   Selama mengerjakan MyPortfolio Mobile, saya menggunakan hot reload untuk melihat hasil perubahan tampilan, misalnya ketika mengatur warna tombol dan memperbaiki susunan kartu. Dengan fitur ini, proses mencoba dan memperbaiki tampilan menjadi lebih cepat karena saya tidak perlu menjalankan ulang aplikasi setiap kali mengubah kode.

   Namun, kalau perubahan berkaitan dengan proses awal aplikasi atau inisialisasi state, saya perlu menggunakan hot restart. Jika perubahan berkaitan dengan konfigurasi native atau integrasi platform, saya perlu melakukan full restart.

   Jadi, ketiganya punya kegunaan masing-masing. Hot reload cocok untuk perubahan yang bisa langsung diterapkan tanpa mengulang aplikasi, hot restart digunakan ketika aplikasi perlu dijalankan ulang dari awal, sedangkan full restart diperlukan untuk perubahan yang membutuhkan proses menjalankan ulang aplikasi secara penuh.

### Penggunaan AI (AI Disclosure)
Dalam pengerjaan Individual Assignment 7, saya menggunakan Google Gemini sebagai alat bantu untuk memahami instruksi tugas, mengevaluasi implementasi kode, dan mempelajari konsep dasar Flutter. Saya memberikan instruksi tugas secara lengkap, kemudian mengajukan pertanyaan secara bertahap berdasarkan bagian yang belum saya pahami.

Secara khusus, Gemini membantu saya memahami perbedaan pewarnaan tombol antara Tutorial 08 dan Individual Assignment 7, penggunaan atribut `Color color` pada model `ItemHomepage`, serta penyesuaian tampilan ketika terjadi bottom overflow. Gemini juga membantu saya mengeksplorasi penambahan menu Education, memahami fungsi `childAspectRatio`, dan mempelajari konsep widget tree, `MaterialApp`, `StatelessWidget`, `StatefulWidget`, `BuildContext`, hot reload, serta hot restart melalui analogi kehidupan sehari-hari. Selain itu, Gemini digunakan sebagai sarana untuk memahami maksud setiap pertanyaan reflektif dan hubungannya dengan implementasi kode.

Meskipun membantu proses pembelajaran, hasil dari AI tidak selalu dapat langsung diterapkan. Beberapa saran masih menggunakan contoh nama variabel, data profil, atau konfigurasi kode yang berbeda dari proyek saya. Penjelasan teknis yang diberikan juga perlu diperiksa kembali karena AI dapat memberikan rekomendasi yang kurang sesuai dengan kondisi implementasi sebenarnya. Oleh karena itu, saya tidak menggunakan seluruh saran secara langsung, melainkan membandingkannya dengan instruksi resmi tugas, materi Tutorial 08, dan struktur kode proyek yang sedang dikerjakan.

Sebagai bentuk verifikasi dan perbaikan manual, saya menyesuaikan setiap perubahan dengan struktur `main.dart` dan `menu.dart` yang sudah ada, menentukan sendiri nama serta warna setiap menu, mengatur tampilan agar tidak mengalami overflow, dan memeriksa hasil implementasi melalui pengujian aplikasi. Saya juga menjalankan `flutter analyze` untuk memastikan tidak terdapat masalah pada kode serta menambahkan komentar dokumentatif pada class, constructor, dan method agar kode lebih mudah dipahami dan dipelihara. Dengan demikian, Google Gemini digunakan sebagai pendamping pembelajaran dan pemberi masukan, sedangkan keputusan implementasi, penyesuaian, dan pemeriksaan akhir tetap saya lakukan sendiri.

Bukti percakapan: https://gemini.google.com/share/d/14gCY-GqjEsaBRo7x9A66Zoo2x_ockmGa?usp=sharing


### Tugas 8

1. Perbedaan Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop()
Dalam Flutter, navigasi digunakan untuk berpindah dari satu halaman ke halaman lainnya. Flutter menggunakan widget `Navigator` untuk mengatur perpindahan antarrute (route). Navigator bekerja dengan konsep stack atau tumpukan halaman, yaitu halaman yang terakhir dibuka akan berada di posisi paling atas dan ditampilkan kepada pengguna.

Pada tugas ini, saya menggunakan tiga method Navigator, yaitu `push()`, `pushReplacement()`, dan `pop()`. Ketiganya memiliki fungsi yang berbeda sesuai dengan kebutuhan navigasi aplikasi.

`Navigator.push()` digunakan untuk membuka halaman baru dengan menambahkannya ke atas stack navigasi. Halaman sebelumnya tetap tersimpan sehingga pengguna bisa kembali menggunakan tombol Back bawaan perangkat. Pada aplikasi My Portfolio Mobile, method ini digunakan untuk membuka halaman formulir Education melalui pilihan Add Education pada Drawer. Method yang sama juga digunakan pada kartu aksi di halaman utama untuk membuka formulir.

Contoh implementasi pada Drawer:
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const EducationFormPage(),
  ),
);
```

Pada kode tersebut, `MaterialPageRoute` menentukan halaman yang akan dibuka, yaitu `EducationFormPage`. Ketika pengguna menekan Add Education, halaman formulir akan ditampilkan tanpa menghapus halaman sebelumnya dari stack navigasi. Jadi, pengguna masih bisa kembali ke halaman sebelumnya.

Selanjutnya, `Navigator.pushReplacement()` digunakan untuk mengganti halaman yang sedang dibuka dengan halaman baru. Berbeda dengan `push()`, method ini menggantikan route yang sedang aktif sehingga route sebelumnya tidak lagi berada di posisi yang sama dalam stack.

Pada aplikasi ini, `pushReplacement()` digunakan ketika pengguna memilih menu Home pada Drawer.
Contoh implementasinya:
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  ),
);
```

Ketika pengguna sedang berada di halaman Add Education Form dan memilih Home, halaman tersebut akan digantikan dengan halaman utama (`MyHomePage`). Saya menggunakan method ini agar pengguna bisa langsung kembali ke halaman utama melalui Drawer, termasuk ketika menjalankan aplikasi menggunakan Chrome.

Sementara itu, `Navigator.pop()` digunakan untuk menutup halaman atau route yang sedang berada di posisi paling atas stack navigasi. Pada tugas ini, saya menggunakannya pada tombol OK di dalam `AlertDialog`.

Contoh implementasinya:
```dart
TextButton(
  child: const Text('OK'),
  onPressed: () {
    Navigator.pop(context);
  },
)
```

Ketika tombol OK ditekan, dialog ringkasan Education akan ditutup dan pengguna kembali ke halaman formulir.

Jadi, perbedaan ketiganya terletak pada cara mengatur halaman dalam stack. `push()` digunakan untuk membuka halaman baru, `pushReplacement()` digunakan untuk mengganti halaman yang sedang aktif, sedangkan `pop()` digunakan untuk menutup halaman atau dialog yang sedang terbuka. Dalam tugas ini, ketiganya digunakan sesuai kebutuhan navigasi aplikasi.

2. Peran Scaffold, AppBar, dan Drawer dalam Menjaga Konsistensi Struktur Halaman
Dalam Flutter, `Scaffold` merupakan widget yang digunakan untuk membuat struktur dasar sebuah halaman dengan Material Design. Widget ini menyediakan beberapa bagian utama, seperti AppBar, Drawer, dan body. Pada tugas ini, saya menggunakan Scaffold pada halaman Education Form agar susunan halaman tetap konsisten dengan halaman utama dan halaman Add Project.

Pada halaman `EducationFormPage`, Scaffold menampung AppBar, Drawer, dan Form sebagai bagian dari body.

```dart
return Scaffold(
  appBar: AppBar(
    title: const Center(
      child: Text('Add Education Form'),
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  drawer: const LeftDrawer(),
  body: Form(
    key: _formKey,
    child: SingleChildScrollView(
      // Isi formulir
    ),
  ),
);
```

`AppBar` merupakan bagian atas halaman yang digunakan untuk menampilkan judul sekaligus menyediakan akses ke Drawer. Pada halaman Education Form, AppBar menampilkan judul "Add Education Form". Saya menggunakan `Colors.indigo` sebagai warna latar belakang dan `Colors.white` untuk teks serta ikon agar tampilannya sesuai dengan tema aplikasi My Portfolio Mobile.

Kemudian, `Drawer` merupakan menu navigasi yang muncul dari sisi kiri layar. Drawer memudahkan pengguna untuk berpindah halaman tanpa harus selalu menggunakan tombol Back. Pada aplikasi ini, saya membuat Drawer secara terpisah di file `lib/widgets/left_drawer.dart` melalui widget `LeftDrawer`, sehingga komponen yang sama bisa digunakan kembali pada halaman lain.

Di dalam Drawer terdapat tiga pilihan menu, yaitu Home, Add Project, dan Add Education. Menu Home digunakan untuk kembali ke halaman utama menggunakan `Navigator.pushReplacement()`, sedangkan Add Project dan Add Education digunakan untuk membuka halaman formulir masing-masing menggunakan `Navigator.push()`.

Saya juga menggunakan `DrawerHeader` untuk menampilkan identitas aplikasi berupa judul "My Portfolio" dan deskripsi singkat "Explore personal projects and experiences!".

Untuk menjaga konsistensi tampilan, saya menggunakan warna indigo pada beberapa bagian aplikasi, seperti AppBar halaman Education, DrawerHeader, dan tombol Simpan. Warna putih digunakan pada teks AppBar dan DrawerHeader agar mudah dibaca. Dengan penggunaan warna yang sama, halaman utama, Drawer, dan halaman formulir tetap memiliki tampilan yang seragam.

3. Alasan Pemilihan Tata Letak dan Peran Widget Pengatur Jarak serta Penggulir
Pada halaman Education Form, saya menggunakan beberapa widget layout untuk menyusun komponen formulir agar lebih rapi dan mudah digunakan. Widget yang saya gunakan adalah `SingleChildScrollView`, `Column`, `Padding`, dan `Align`.

`SingleChildScrollView` digunakan agar konten di dalamnya dapat digulir ketika ukuran layar tidak cukup untuk menampilkan seluruh komponen. Saya menggunakan widget ini sebagai pembungkus `Column` di dalam Form.

```dart
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Input formulir dan tombol Simpan
      ],
    ),
  ),
),
```

Saya memilih widget ini karena formulir memiliki beberapa kolom input dan tombol Simpan yang disusun secara vertikal. Ketika aplikasi dibuka pada layar ponsel atau keyboard muncul dan mengurangi ruang tampilan, pengguna masih bisa menggulir halaman untuk menjangkau bagian formulir yang belum terlihat.

Selanjutnya, `Column` digunakan untuk menyusun widget secara vertikal atau dari atas ke bawah. Saya menggunakannya karena ketiga input Education perlu ditampilkan secara berurutan, yaitu Nama Institusi, Jenjang Pendidikan, dan Program Studi. Setelah ketiga input tersebut, terdapat tombol Simpan. Saya juga menggunakan `crossAxisAlignment: CrossAxisAlignment.start` agar komponen di dalam Column memiliki perataan ke sisi kiri.

Kemudian, `Padding` digunakan untuk memberikan jarak di sekitar widget agar komponen tidak saling menempel. Pada setiap `TextFormField`, saya menggunakan `EdgeInsets.all(8.0)` sehingga terdapat jarak sebesar 8 logical pixels pada setiap sisi input.

Contoh penggunaannya:
```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    // Konfigurasi input
  ),
)
```

Saya juga menggunakan `Padding` pada tombol Simpan agar tampilannya tidak terlalu rapat dengan komponen lainnya.

Selain itu, `Align` digunakan untuk mengatur posisi sebuah widget. Pada halaman Education Form, saya menggunakannya untuk menempatkan tombol Simpan di bagian tengah secara horizontal dan bagian bawah pada area penempatannya.

```dart
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      // Tombol Simpan
    ),
  ),
)
```

Secara keseluruhan, saya memilih susunan layout tersebut karena formulir memiliki beberapa input yang perlu ditampilkan secara berurutan. `Column` membantu menyusun komponen, `Padding` memberikan jarak, `Align` mengatur posisi tombol, dan `SingleChildScrollView` memungkinkan pengguna menggulir halaman ketika ruang layar terbatas. Dengan begitu, formulir tetap bisa digunakan pada ukuran layar yang berbeda.

4. Peran GlobalKey<FormState>, Validator, dan Validate() dalam Proses Validasi Formulir
Dalam Flutter, widget `Form` digunakan untuk mengelompokkan beberapa input field agar dapat dikelola dan divalidasi bersama. Pada tugas ini, saya menggunakan Form untuk menampung tiga input pendidikan, yaitu Nama Institusi, Jenjang Pendidikan, dan Program Studi.

Agar seluruh input bisa diperiksa sebelum data ditampilkan, saya menggunakan `GlobalKey<FormState>`, `validator`, dan method `validate()`.

Pertama, `GlobalKey<FormState>` digunakan untuk mengidentifikasi Form dan mengakses state yang dimilikinya. Pada halaman Education Form, saya mendeklarasikan key tersebut sebagai berikut:

```dart
final _formKey = GlobalKey<FormState>();
```

Kemudian, key tersebut dihubungkan dengan widget Form melalui properti `key`.

```dart
Form(
  key: _formKey,
  child: SingleChildScrollView(
    // Isi formulir
  ),
)
```

Dengan menggunakan `_formKey`, saya bisa mengakses FormState dari bagian kode lainnya, terutama ketika tombol Simpan ditekan. Melalui `_formKey.currentState`, saya dapat menjalankan method seperti `validate()` untuk memeriksa seluruh input yang ada di dalam Form.

Selanjutnya, `validator` digunakan untuk memeriksa apakah nilai yang dimasukkan pengguna sudah memenuhi ketentuan. Pada halaman Education, ketiga kolom wajib diisi sehingga masing-masing `TextFormField` memiliki validator.

Contoh validator pada kolom Nama Institusi:

```dart
validator: (String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Nama institusi tidak boleh kosong!';
  }
  return null;
},
```

Pada kode tersebut, `value` merupakan nilai yang dimasukkan pengguna. Saya menggunakan `trim().isEmpty` untuk memeriksa apakah input kosong atau hanya berisi spasi. Jika kondisi tersebut terpenuhi, validator akan mengembalikan pesan kesalahan. Sebaliknya, jika input sudah diisi dengan benar, validator mengembalikan `null`, yang berarti input tersebut valid.

Pola validasi yang sama juga diterapkan pada kolom Jenjang Pendidikan dan Program Studi, tetapi dengan pesan kesalahan yang disesuaikan.

Contoh nilai yang ditolak adalah ketika pengguna mengisi kolom Nama Institusi dengan `"     "` atau beberapa karakter spasi saja. Walaupun kolom tersebut terlihat sudah diisi, sebenarnya tidak ada informasi yang diberikan. Karena itu, input seperti ini tetap harus ditolak.

Kemudian, `validate()` merupakan method yang digunakan untuk menjalankan seluruh validator pada field yang terdapat di dalam Form. Pada tugas ini, proses validasi dijalankan ketika pengguna menekan tombol Simpan.

```dart
void _showEducationDialog() {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // Ringkasan data
        );
      },
    );
  }
}
```

Ketika tombol Simpan ditekan, fungsi `_showEducationDialog()` akan dipanggil. Selanjutnya, `_formKey.currentState!.validate()` akan memeriksa seluruh input yang memiliki validator.

Jika terdapat input yang tidak valid, method tersebut akan menghasilkan nilai `false`. Akibatnya, dialog ringkasan tidak akan ditampilkan dan pesan kesalahan akan muncul pada kolom yang bermasalah. Namun, jika seluruh input sudah valid, method tersebut akan menghasilkan nilai `true` sehingga aplikasi melanjutkan proses dengan memanggil `showDialog()` untuk menampilkan ringkasan data yang dimasukkan pengguna.

Pemilihan jenis input atau keyboard saja belum cukup untuk memastikan bahwa data yang dimasukkan benar. Jenis input dan keyboard hanya membantu pengguna memasukkan data sesuai kebutuhan, tetapi tidak selalu bisa memeriksa isi data tersebut. Contohnya, meskipun menggunakan `TextFormField` dengan keyboard teks, pengguna masih bisa memasukkan beberapa spasi saja. Karena itu, diperlukan validator untuk memeriksa isi input sebelum diproses lebih lanjut.

Pada implementasi ini, saya menggunakan `TextFormField` karena ketiga informasi pendidikan yang dibutuhkan berupa teks. Namun, saya tetap menambahkan validator agar setiap kolom wajib diisi dan tidak hanya berisi spasi.

Dari implementasi tersebut, saya memahami bahwa `GlobalKey<FormState>` digunakan untuk mengakses kondisi Form, `validator` menentukan aturan pemeriksaan setiap input, sedangkan `validate()` menjalankan seluruh aturan tersebut ketika pengguna menekan tombol Simpan.

Melalui tugas ini, saya belajar bahwa membuat formulir di Flutter bukan hanya tentang menampilkan kolom input, tetapi juga memastikan data yang dimasukkan sudah sesuai sebelum ditampilkan kepada pengguna. Pada aplikasi ini, data Education belum disimpan ke database, melainkan ditampilkan sementara melalui `AlertDialog` setelah seluruh input berhasil divalidasi. Dengan begitu, saya bisa menerapkan materi Tutorial 09 mengenai Form, validasi input, dan dialog ringkasan secara langsung pada proyek portofolio mobile saya.

### AI Disclosure
Dalam pengerjaan Individual Assignment 8, saya menggunakan ChatGPT sebagai alat bantu belajar untuk memahami materi Flutter Navigation, Layouts, Forms, and Input Elements. ChatGPT membantu saya memahami instruksi tugas, menjelaskan fungsi beberapa widget dan method Flutter, memeriksa implementasi kode, serta membantu menyusun dokumentasi dan jawaban reflektif di README.md.

Selama pengerjaan, saya menggunakan ChatGPT untuk beberapa hal, seperti memahami perbedaan `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`, mempelajari fungsi `Scaffold`, `AppBar`, `Drawer`, `Column`, `Padding`, `Align`, dan `SingleChildScrollView`, serta memahami penggunaan `GlobalKey<FormState>`, `validator`, dan `validate()` pada formulir.

Saya juga memberikan kode `education_form.dart` dan `left_drawer.dart` yang sudah saya buat kepada ChatGPT untuk diperiksa kesesuaiannya dengan instruksi tugas. Selain itu, saya menggunakan screenshot aplikasi untuk membantu memeriksa tampilan Drawer dan halaman Education Form.

Dalam proses tersebut, saya tidak hanya meminta jawaban akhir, tetapi juga meminta penjelasan mengenai alasan penggunaan setiap widget dan bagaimana kode tersebut bekerja. Beberapa contoh prompt yang saya gunakan adalah:

- Bantu periksa apakah implementasi halaman formulir Education dan Drawer saya sudah sesuai dengan checklist Individual Assignment 8.
- Jelaskan perbedaan Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop() berdasarkan kode yang saya gunakan.
- Periksa penggunaan GlobalKey<FormState>, validator, dan validate() pada formulir Education saya.
- Bantu susun jawaban reflektif README berdasarkan kode yang sudah saya buat.

Menurut saya, penggunaan AI cukup membantu dalam memahami konsep yang sebelumnya belum terlalu saya kuasai. Namun, jawaban AI tetap perlu diperiksa kembali karena tidak semua saran yang diberikan pasti sesuai dengan kondisi proyek. Karena itu, saya mencocokkan penjelasannya dengan materi Tutorial 09 dan kode yang saya gunakan, serta memastikan kembali hasil implementasinya melalui aplikasi yang dijalankan.

Saya juga memahami bahwa AI dapat memberikan penjelasan yang terlalu umum atau menyarankan implementasi yang berbeda dari struktur proyek yang sudah ada. Oleh karena itu, saya tidak langsung menerapkan semua saran yang diberikan, tetapi mempertimbangkan kesesuaiannya dengan instruksi tugas dan materi yang dipelajari.
