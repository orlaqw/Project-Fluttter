import 'package:flutter/material.dart';
import 'package:movie_app/models/user_login.dart';


class BottomNav extends StatefulWidget {
  int activePage; //Constructor BottomNav ini diberi parameter dengan nama activePage tipe integer agar bisa mendeteksi menu yang aktif sehingga warna pada menu yang aktif akan berbeda.
  BottomNav(this.activePage);


  @override
  State<BottomNav> createState() => _BottomNavState();
}


class _BottomNavState extends State<BottomNav> {
  UserLogin userLogin = UserLogin();
  String? role;
  getDataLogin() async {
    var user = await userLogin!.getUserLogin(); //Untuk memilah-milah menu untuk role yang sesuai maka anda perlu menampilkan role yang tersimpan di system dengan cara memanggil function getUserLogin()
    if (user!.status != false) {
      setState(() {
        role = user.role;
      });
    } else {
      Navigator.popAndPushNamed(context, '/login');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLogin();
  }


  void getLink(index) { //Agar menu bisa di klik dan menuju ke halaman yang dituju maka anda membutuhkan attribute onTap yang bertugas sebagai event klik.
    if (role == "admin") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/movie');
      }
    } else if (role == "kasir") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/pesan');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return role == "admin"
        ? BottomNavigationBar( //Variable activePage akan dipanggil di script bottomNavigationBar tepatnya di attribute currentIndex dengan isian widget.activePage
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: widget.activePage,
            onTap: (index) => {getLink(index)},
            items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_copy),
                  label: 'Movie',
                ),
              ])
        : role == "kasir"
            ? BottomNavigationBar(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                currentIndex: widget.activePage,
                onTap: (index) => {getLink(index)},
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard),
                      label: 'Pesan',
                    ),
                  ])
            : Text("");
  }
}
