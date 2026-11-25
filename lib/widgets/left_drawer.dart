import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/education_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form_screen.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

/// Widget Drawer yang menyediakan navigasi ke halaman utama
/// dan halaman untuk menambahkan proyek baru.
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  /// Membangun tampilan Drawer Menu pada sisi kiri aplikasi.
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthState>().isLoggedIn;
    return Drawer(
      // ListView menyusun isi Drawer secara vertikal
      // dan memungkinkan konten di-scroll jika diperlukan.
      child: ListView(
        children: [
          // Header Drawer berisi judul dan deskripsi aplikasi.
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
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
                  style: TextStyle(fontSize: 15, color: Colors.white),
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
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),

          // Menu navigasi untuk membuka halaman tambah achievement/proyek.
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Project'),

            // Drawer ditutup terlebih dahulu. Jika belum login, pengguna
            // diarahkan ke halaman Login sebelum membuka form.
            onTap: () async {
              Navigator.pop(context);
              if (!await ensureLoggedIn(context) || !context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProjectFormScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.folder_open),
            title: const Text('View Projects'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const ProjectListScreen(),
              ),
            ),
          ),

          // Menu ini membuka form Education dari drawer yang sama dengan Home
          // dan Add Project, sehingga navigasi konsisten di setiap halaman.
          ListTile(
            leading: const Icon(Icons.school_outlined),
            title: const Text('Add Education'),

            // push mempertahankan halaman saat ini di stack agar pengguna
            // dapat kembali dengan Back setelah membuka form Education.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EducationFormPage(),
                ),
              );
            },
          ),
          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
                );
              },
            )
          else
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                Navigator.pop(context);
                await context.read<AuthState>().logout();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Successfully logged out.')),
                );
              },
            ),
        ],
      ),
    );
  }
}
