import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _notifMessage;
  bool _isSuccess = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('https://learn.smktelkom-mlg.sch.id/ukl1/api/login');
      final response = await http.post(
        url,
        body: {
          'username': _usernameController.text,
          'password': _passwordController.text,
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Nama Bank',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) =>
                        value!.isEmpty ? 'Field harus diisi' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) =>
                        value!.isEmpty ? 'Field harus diisi' : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
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
      ),
    );
  }
}
