
import 'package:material_ui/material_ui.dart';

/// Halaman untuk menampilkan form penambahan proyek baru.
/// Pengguna dapat mengisi informasi proyek, memilih kategori,
/// kemudian melihat data yang dimasukkan melalui pop-up.
class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  // GlobalKey digunakan untuk mengakses FormState,
  // sehingga form dapat melakukan validasi dan reset.
  final _formKey = GlobalKey<FormState>();

  // Variabel untuk menyimpan data yang dimasukkan pengguna.
  String _projectName = "";
  String _description = "";
  String _category = "Web Development";
  String _technologies = "";
  String _projectLink = "";

  // Daftar kategori proyek yang dapat dipilih pengguna.
  final List<String> _categories = [
    'Web Development',
    'Mobile Development',
    'Machine Learning',
    'Data Science',
    'Other',
  ];

  /// Mengatur ulang seluruh data dan kondisi form
  /// setelah pengguna selesai melihat pop-up.
  void _resetForm() {
    _formKey.currentState!.reset();

    setState(() {
      _projectName = "";
      _description = "";
      _category = "Web Development";
      _technologies = "";
      _projectLink = "";
    });
  }

  /// Menampilkan pop-up berisi seluruh informasi proyek
  /// setelah semua field wajib berhasil melewati validasi.
  void _showProjectDialog() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // Judul pop-up konfirmasi.
            title: const Text('Proyek berhasil ditambahkan!'),

            // Menampilkan seluruh data proyek yang telah diisi.
            // SingleChildScrollView menjaga konten tetap dapat di-scroll
            // apabila informasi proyek cukup panjang.
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Proyek: $_projectName'),
                  Text('Deskripsi: $_description'),
                  Text('Kategori: $_category'),
                  Text('Teknologi: $_technologies'),
                  Text('Tautan: $_projectLink'),
                ],
              ),
            ),

            // Tombol untuk menutup pop-up dan mengosongkan form.
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  _resetForm();
                },
              ),
            ],
          );
        },
      );
    }
  }

  /// Membangun tampilan halaman form tambah proyek.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar menampilkan judul halaman.
      appBar: AppBar(
        title: const Text('Tambah Proyek'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),

      // Form menjadi wadah seluruh input dan validasi.
      body: Form(
        key: _formKey,

        // SingleChildScrollView memungkinkan halaman digulir
        // apabila seluruh field tidak muat dalam layar.
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Project Name ===
              // Input untuk nama proyek.
              // Field ini wajib diisi.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Proyek",
                    labelText: "Nama Proyek",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Menyimpan perubahan input ke variabel _projectName.
                  onChanged: (String? value) {
                    setState(() {
                      _projectName = value!;
                    });
                  },

                  // Memastikan nama proyek tidak kosong.
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama proyek tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              // Input untuk deskripsi proyek.
              // maxLines: 5 memberikan ruang untuk deskripsi lebih panjang.
              // Field ini wajib diisi.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Proyek",
                    labelText: "Deskripsi Proyek",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Menyimpan perubahan input ke variabel _description.
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },

                  // Memastikan deskripsi proyek tidak kosong.
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi proyek tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Category ===
              // Dropdown untuk memilih kategori proyek.
              // Nilai awal adalah Web Development.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori Proyek",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Menentukan kategori yang dipilih secara default.
                  initialValue: _category,

                  // Menampilkan seluruh pilihan kategori.
                  items: _categories
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),

                  // Memperbarui kategori ketika pengguna memilih opsi.
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === Technologies ===
              // Input untuk teknologi yang digunakan.
              // Contohnya Flutter, Django, dan Figma.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Flutter, Django, Figma",
                    labelText: "Teknologi yang Digunakan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Menyimpan perubahan input ke variabel _technologies.
                  onChanged: (String? value) {
                    setState(() {
                      _technologies = value!;
                    });
                  },
                ),
              ),

              // === Project Link ===
              // Input untuk tautan proyek.
              // Field ini bersifat opsional.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Proyek (opsional)",
                    labelText: "Tautan Proyek",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Menyimpan perubahan input ke variabel _projectLink.
                  onChanged: (String? value) {
                    setState(() {
                      _projectLink = value!;
                    });
                  },
                ),
              ),

              // === Tombol Simpan ===
              // Tombol untuk memvalidasi form dan menampilkan pop-up.
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.indigo),
                    ),

                    // Memanggil fungsi untuk memvalidasi
                    // dan menampilkan data proyek.
                    onPressed: _showProjectDialog,

                    child: const Text(
                      "Save",
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
