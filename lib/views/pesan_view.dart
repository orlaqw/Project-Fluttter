import 'package:flutter/material.dart';
import 'package:movie_app/widgets/bottom_nav.dart';


class PesanView extends StatefulWidget {
  const PesanView({super.key});


  @override
  State<PesanView> createState() => _PesanViewState();
}


class _PesanViewState extends State<PesanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesan"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Text("Pesan"),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
