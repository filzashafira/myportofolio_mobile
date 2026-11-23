
import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/education_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';

/// Widget Drawer yang menyediakan navigasi ke halaman utama
/// dan halaman untuk menambahkan proyek baru.
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  /// Membangun tampilan Drawer Menu pada sisi kiri aplikasi.
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ListView menyusun isi Drawer secara vertikal
      // dan memungkinkan konten di-scroll jika diperlukan.
      child: ListView(
        children: [
          // Header Drawer berisi judul dan deskripsi aplikasi.
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Menampilkan judul aplikasi pada bagian header.
                Text(
                  'My Portfolio',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 10),

                // Menampilkan deskripsi singkat aplikasi.
                Text(
                  'Explore personal projects and experiences!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Menu navigasi untuk kembali ke halaman utama.
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),

            // Mengganti halaman saat ini dengan halaman utama.
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),

          // Menu navigasi untuk membuka halaman tambah proyek.
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Project'),

            // Membuka halaman ProjectFormPage melalui Navigator.push().
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProjectFormPage(),
                ),
              );
            },
          ),

          // Menu navigasi untuk membuka halaman tambah Education.
          ListTile(
            leading: const Icon(Icons.school_outlined),
            title: const Text('Add Education'),

            // Membuka EducationFormPage melalui Navigator.push().
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EducationFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
