
import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';

/// Widget halaman utama MyPortfolio yang menampilkan informasi pengguna
/// serta menu aksi untuk mengakses fitur proyek, education, dan logout.
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = "2506623641";
  final String nama = "Filza Shafira";
  final String kelas = "PBP C";

  // Menyimpan informasi identitas pengguna yang ditampilkan pada halaman utama.
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Proyek", Icons.folder, Colors.blue),
    ItemHomepage("Tambah Proyek", Icons.add_circle, Colors.green),
    ItemHomepage("Lihat Education", Icons.school, Colors.purple),
    ItemHomepage("Tambah Education", Icons.library_add, Colors.orange),
    ItemHomepage("Logout", Icons.logout, Colors.red),
  ];

  /// Membangun tampilan halaman utama yang terdiri dari AppBar,
  /// kartu informasi pengguna, pesan sambutan, dan kartu menu.
  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur visual dasar halaman aplikasi.
    return Scaffold(
      // AppBar menampilkan bar bagian atas halaman aplikasi.
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,

        // Mengatur warna ikon AppBar, termasuk ikon hamburger Drawer.
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // Menambahkan Drawer Menu untuk navigasi antarhalaman.
      drawer: const LeftDrawer(),

      // Body halaman utama dengan padding di sekelilingnya.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Baris horizontal untuk menampilkan 3 InfoCard secara sejajar.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: nama),
                  InfoCard(title: 'Class', content: kelas),
                ],
              ),

              const SizedBox(height: 16.0),

              // Bagian tengah: pesan sambutan dan kisi tombol menu portofolio.
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Selamat datang di MyPortfolio Mobile!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    // GridView menampilkan empat kartu tombol dalam dua kolom.
                    GridView.count(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,

                      // Menyesuaikan rasio ukuran kartu berdasarkan lebar layar.
                      childAspectRatio:
                          MediaQuery.of(context).size.width > 600 ? 2.8 : 1.2,

                      // Mengatur tinggi GridView agar mengikuti ukuran isinya.
                      shrinkWrap: true,

                      // Mengambil empat menu pertama untuk ditampilkan dalam grid.
                      children: items.take(4).map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),

                    const SizedBox(height: 10),

                    // Tombol Logout ditampilkan terpisah di bagian bawah.
                    SizedBox(
                      width: 150,
                      height: 90,
                      child: ItemCard(items[4]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget untuk menampilkan informasi pengguna dalam bentuk kartu.
/// Setiap kartu memiliki judul dan isi informasi.
class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan judul (title) dan isi (content).
  final String title;
  final String content;

  /// Constructor InfoCard yang mewajibkan nilai title dan content
  /// agar setiap kartu memiliki informasi yang lengkap.
  const InfoCard({super.key, required this.title, required this.content});

  /// Membangun tampilan informasi pengguna dengan judul dan isi secara vertikal.
  @override
  Widget build(BuildContext context) {
    return Card(
      // Memberikan efek bayangan kartu elevasi 2 unit.
      elevation: 2.0,
      child: Container(
        // Menyesuaikan lebar kartu dengan proporsi layar (dibagi 3.5).
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),

        // Menyusun teks title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

/// Model data untuk setiap menu pada halaman utama.
/// Menyimpan nama menu, ikon, dan warna yang digunakan oleh ItemCard.
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  /// Constructor untuk menginisialisasi data setiap item menu.
  ItemHomepage(this.name, this.icon, this.color);
}
