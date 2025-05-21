import 'dart:io';
import 'package:flutter/foundation.dart'; // untuk kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _teleponController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  XFile? _imageFile;
  bool _isLoading = false;
  String? _message;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      final uri = Uri.parse("https://learn.smktelkom-mlg.sch.id/ukl1/api/register");

      var request = http.MultipartRequest("POST", uri)
        ..fields['nama_nasabah'] = _namaController.text
        ..fields['gender'] = _genderController.text
        ..fields['alamat'] = _alamatController.text
        ..fields['telepon'] = _teleponController.text
        ..fields['username'] = _usernameController.text
        ..fields['password'] = _passwordController.text;

      if (_imageFile != null) {
        if (kIsWeb) {
          request.files.add(
            http.MultipartFile.fromBytes(
              'foto',
              await _imageFile!.readAsBytes(),
              filename: _imageFile!.name,
              contentType: MediaType('image', 'jpeg'),
            ),
          );
        } else {
          request.files.add(
            await http.MultipartFile.fromPath(
              'foto',
              _imageFile!.path,
              contentType: MediaType('image', 'jpeg'),
            ),
          );
        }
      }

      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      var data = jsonDecode(responseData.body);

      if (data['status'] == true) {
        setState(() {
          _message = "✅ Berhasil register: ${data['message']}";
        });
      } else {
        setState(() {
          _message = "❌ Gagal register: ${data['message']}";
        });
      }
    } catch (e) {
      setState(() {
        _message = "❌ Error: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nama Bank - Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("Register", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama Nasabah"),
                validator: (val) => val!.isEmpty ? "Field harus diisi" : null,
              ),

              DropdownButtonFormField<String>(
                value: _genderController.text.isEmpty ? null : _genderController.text,
                decoration: const InputDecoration(labelText: "Gender"),
                items: const [
                  DropdownMenuItem(value: "Laki-laki", child: Text("Laki-laki")),
                  DropdownMenuItem(value: "Perempuan", child: Text("Perempuan")),
            ],
            onChanged: (value) {
              setState(() {
                _genderController.text = value!;
              });
            },
            validator: (value) => value == null || value.isEmpty ? "Pilih gender" : null,
            ),  



              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(labelText: "Alamat"),
                validator: (val) => val!.isEmpty ? "Field harus diisi" : null,
              ),

              TextFormField(
                controller: _teleponController,
                decoration: const InputDecoration(labelText: "Telepon"),
                validator: (val) => val!.isEmpty ? "Field harus diisi" : null,
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text("Pilih Foto"),
                  ),
                  const SizedBox(width: 10),
                  if (_imageFile != null)
                    kIsWeb
                        ? Image.network(_imageFile!.path, width: 100, height: 100)
                        : Image.file(File(_imageFile!.path), width: 100, height: 100),
                ],
              ),

              const SizedBox(height: 10),

              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (val) => val!.isEmpty ? "Field harus diisi" : null,
              ),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                validator: (val) => val!.isEmpty ? "Field harus diisi" : null,
              ),

              const SizedBox(height: 20),

              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _register,
                      child: const Text("Register"),
                    ),

              if (_message != null) ...[
                const SizedBox(height: 16),
                Text(
                  _message!,
                  style: TextStyle(
                    color: _message!.contains("✅") ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
