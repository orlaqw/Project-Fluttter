import 'package:flutter/material.dart';
import 'package:paket_1_ukl_frontend_semester2/HalamanMatkul/views/matkul_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemilihan Matkul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MatkulPage(),
    );
  }
}
