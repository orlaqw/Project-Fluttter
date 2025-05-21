import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _teleponController = TextEditingController();
  String? _selectedGender;

  String? _notifMessage;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final response = await http.get(
      Uri.parse('https://learn.smktelkom-mlg.sch.id/ukl1/api/profil'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == true) {
        final profile = data['data'];
        setState(() {
          _namaController.text = profile['nama_pelanggan'];
          _alamatController.text = profile['alamat'];
          _teleponController.text = profile['telepon'];
          _selectedGender = profile['gender'];
        });
      }
    }
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('https://learn.smktelkom-mlg.sch.id/ukl1/api/update'),
        body: {
          'nama_pelanggan': _namaController.text,
          'alamat': _alamatController.text,
          'gender': _selectedGender,
          'telepon': _teleponController.text,
        },
      );

      final data = json.decode(response.body);
      setState(() {
        _isSuccess = data['status'];
        _notifMessage = data['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama Pelanggan'),
                  validator: (value) => value!.isEmpty ? 'Harus diisi' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _alamatController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) => value!.isEmpty ? 'Harus diisi' : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Laki-laki', 'Perempuan']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Gender'),
                  validator: (value) => value == null ? 'Pilih gender' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _teleponController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Telepon'),
                  validator: (value) => value!.isEmpty ? 'Harus diisi' : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _updateProfile,
                  child: const Text('Update Profil'),
                ),
                const SizedBox(height: 20),
                if (_notifMessage != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _isSuccess ? Colors.green[100] : Colors.red[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _isSuccess ? Icons.check_circle : Icons.error,
                          color: _isSuccess ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _notifMessage!,
                            style: TextStyle(
                              color: _isSuccess ? Colors.green[800] : Colors.red[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
