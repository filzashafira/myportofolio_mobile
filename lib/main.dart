import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

/// Fungsi utama yang menjadi titik awal eksekusi aplikasi Flutter.
void main() {
  // Menjalankan MyApp sebagai root widget aplikasi.
  runApp(MyApp(apiClient: ApiClient()));
}

/// Widget utama yang mengatur konfigurasi dasar aplikasi MyPortfolio.
class MyApp extends StatelessWidget {
  const MyApp({required this.apiClient, super.key});

  final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: apiClient),
        ChangeNotifierProvider(create: (_) => AuthState(apiClient)),
      ],
      child: MaterialApp(
        title: 'MyPortfolio',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        // Di proyek ini halaman utama bernama MyHomePage di menu.dart.
        home: MyHomePage(),
      ),
    );
  }
}
