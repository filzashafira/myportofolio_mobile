
import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

/// Fungsi utama yang menjadi titik awal eksekusi aplikasi Flutter.
void main() {
  // Menjalankan MyApp sebagai root widget aplikasi.
  runApp(const MyApp());
}

/// Widget utama yang mengatur konfigurasi dasar aplikasi MyPortfolio.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Membangun konfigurasi aplikasi, termasuk tema dan halaman awal.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menentukan judul aplikasi.
      title: 'MyPortfolio',

      // Mengatur tema warna dan penggunaan Material Design 3.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          secondary: Colors.amber[700],
        ),
        useMaterial3: true,
      ),

      // Menentukan MyHomePage dari menu.dart sebagai halaman pertama aplikasi.
      home: MyHomePage(),
    );
  }
}
