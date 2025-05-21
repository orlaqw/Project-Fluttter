import 'package:flutter/material.dart';
import 'package:paket_1_ukl_frontend_semester2/HalamanRegistrasi/views/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nama Bank',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegisterView(),
    );
  }
}
