import 'package:flutter/material.dart';
import 'package:movie_app/models/user_login.dart';
import 'package:movie_app/widgets/bottom_nav.dart';


class DashboardView extends StatefulWidget {
  const DashboardView({super.key});


  @override
  State<DashboardView> createState() => _DashboardViewState();
}


class _DashboardViewState extends State<DashboardView> {
  UserLogin userLogin = UserLogin(); //Melakukan pendeklarasian variable userLogin dengan memanggil class models
  String? nama; //UserLogin di file user_login.dart untuk mendapatkan data yang sudah login.
  String? role; //Pendeklarasian nama dan role digunakan untuk menyimpan nama dan role yang sudah login.
  getUserLogin() async { //Membuat function getUserLogin() untuk mengambil data yang login.
    var user = await userLogin.getUserLogin(); 
    if (user.status != false) { //logika if untuk mengecek apakah data yang tersimpan ada atau tidak ada.
      setState(() { //menggunakan function setState agar penyimpanannya bisa realTime.
        nama = user.nama_user;
        role = user.role;
      });
    }
  }


  @override
  void initState() { //Function getUserLogin() tidak akan berjalan jika tidak dipanggil, maka perlu script initState agar script yang didalamnya initState bisa dijalankan pada awal buka file atau halaman tersebut.
    // TODO: implement initState
    super.initState();
    getUserLogin();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(child: Text("Selamat Datang $nama role anda $role")), //menampilkan variabel nama dan role yang sudah menyimpan datanya
      bottomNavigationBar: BottomNav(0),
    );
  }
}
