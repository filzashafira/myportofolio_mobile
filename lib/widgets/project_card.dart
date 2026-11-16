
import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';

/// Widget kartu menu yang dapat ditekan oleh pengguna.
/// Kartu menampilkan ikon dan nama menu dengan warna sesuai data ItemHomepage.
class ItemCard extends StatelessWidget {
  // Menyimpan data menu yang akan ditampilkan pada kartu.
  final ItemHomepage item;

  /// Constructor ItemCard untuk menerima data menu yang akan ditampilkan.
  const ItemCard(this.item, {super.key});

  /// Membangun kartu menu beserta interaksi ketika kartu ditekan.
  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Aksi ketika kartu ditekan oleh pengguna.
        onTap: () {
          // Menampilkan SnackBar dengan pesan interaktif.
          ScaffoldMessenger.of(context)
            // Menutup SnackBar sebelumnya agar tidak menumpuk.
            ..hideCurrentSnackBar()
            // Menampilkan pesan sesuai nama menu yang ditekan.
            ..showSnackBar(
              SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"),
              ),
            );

          // Membuka halaman form ketika tombol Tambah Proyek ditekan.
          if (item.name == "Tambah Proyek") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectFormPage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Menampilkan ikon sesuai data menu dengan warna putih.
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),

                // Menampilkan nama menu di bawah ikon.
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
