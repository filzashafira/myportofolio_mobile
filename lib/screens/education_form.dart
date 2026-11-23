import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

/// Halaman form untuk memasukkan dan meninjau informasi pendidikan.
///
/// Form ini meminta nama institusi, jenjang, dan program studi. Data hanya
/// ditampilkan pada dialog setelah seluruh kolom wajib lolos validasi.
class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  /// Membuat state yang menyimpan nilai input selama halaman dibuka.
  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

/// Mengelola nilai input dan validasi pada [EducationFormPage].
class _EducationFormPageState extends State<EducationFormPage> {
  // Key ini menghubungkan state halaman dengan Form di bawahnya, sehingga
  // tombol Simpan dapat meminta semua field menjalankan validator.
  final _formKey = GlobalKey<FormState>();

  // Nilai-nilai ini diperbarui saat pengguna mengetik dan dipakai untuk
  // menyusun ringkasan pada dialog setelah validasi berhasil.
  String _institution = "";
  String _degree = "";
  String _major = "";

  /// Memvalidasi semua kolom, lalu menampilkan ringkasan jika semuanya valid.
  ///
  /// Jika ada nilai kosong atau hanya berisi spasi, [FormState.validate]
  /// mengembalikan `false` dan validator menampilkan pesan pada kolomnya.
  void _showEducationDialog() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Education berhasil ditambahkan!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Institusi: $_institution'),
                  Text('Jenjang: $_degree'),
                  Text('Program Studi: $_major'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  // Menutup dialog saja agar pengguna kembali ke form.
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  /// Menyusun kerangka halaman dan input pendidikan yang bisa digulir.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Education Form'),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Drawer bersama memungkinkan pengguna berpindah ke Home atau form lain.
      drawer: const LeftDrawer(),
      body: Form(
        // Form memakai key ini untuk menjalankan validator saat Simpan ditekan.
        key: _formKey,
        child: SingleChildScrollView(
          // Gulir halaman menjaga tombol Simpan tetap dapat dijangkau pada
          // layar pendek maupun ketika keyboard mengurangi ruang yang tersedia.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama institusi adalah kolom wajib; trim() juga menolak spasi.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Contoh: Universitas Indonesia',
                    labelText: 'Nama Institusi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      // setState membangun ulang halaman dengan nilai terbaru.
                      _institution = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama institusi tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // Jenjang pendidikan, misalnya D3, S1, atau S2, wajib diisi.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Contoh: S1',
                    labelText: 'Jenjang Pendidikan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _degree = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Jenjang pendidikan tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // Program studi, misalnya Ilmu Komputer, wajib diisi.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Contoh: Ilmu Komputer',
                    labelText: 'Program Studi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _major = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Program studi tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // Pemanggilan handler memvalidasi form sebelum dialog dibuka.
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: _showEducationDialog,
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
