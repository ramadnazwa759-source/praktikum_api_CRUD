// lib/edit_user_page.dart
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'user_model.dart';

class EditUserPage extends StatefulWidget {
  final User user;

  const EditUserPage({super.key, required this.user});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Controller diinisialisasi dengan data pengguna yang diterima
  late final TextEditingController _nameController;
  late final TextEditingController _jobController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data user yang ada
    _nameController = TextEditingController(text: widget.user.firstName);
    _jobController = TextEditingController(text: 'Mobile Developer'); // Job tidak ada di response reqres.in, jadi di-hardcode
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  void _submitUpdate() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final String userId = widget.user.id.toString();
        final String newName = _nameController.text;
        final String newJob = _jobController.text;

        final response = await apiService.updateUser(
          userId,
          newName,
          newJob,
        );

        // Tampilkan pesan sukses dari respons API
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'User ${widget.user.id} berhasil diupdate! Nama: ${response['name']} | Job: ${response['job']}')),
        );
        // Kembali ke halaman sebelumnya dan kirim 'true' sebagai indikasi sukses
        Navigator.of(context).pop(true);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengupdate user: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User ID: ${widget.user.id} (Update)'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Mengedit: ${widget.user.firstName} ${widget.user.lastName}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              // Field Nama
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Field Pekerjaan
              TextFormField(
                controller: _jobController,
                decoration: InputDecoration(
                  labelText: 'Pekerjaan',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.work),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pekerjaan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Tombol Update
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _submitUpdate,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Update User'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}