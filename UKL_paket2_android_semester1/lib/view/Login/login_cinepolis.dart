import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/widget/input_widget1.dart';
import 'package:latihan_ukl_paket1android/widget/input_widget3.dart';

class LoginCinepolis extends StatefulWidget {
  const LoginCinepolis({super.key});

  @override
  State<LoginCinepolis> createState() => _LoginCinepolisState();
}

class _LoginCinepolisState extends State<LoginCinepolis> {
bool _isChecked = false;
// get_tekan(){
//     setState(() { //untuk menyimpan/ merubah data secara realtime
//       tekan_click = tekan.text; //jadi nama_lengkap itu isinya dari nama.text/ nama.text disimpan di nama_lengkap
//     });
//   }

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          // padding: EdgeInsets.all(10),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/splashCinepolis.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Column(
            children: [
        
              Stack(
                children: [
        
                Image(image: AssetImage('assets/cinema.png')),
                Positioned.fill(
                  child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                      const Color.fromARGB(0, 255, 255, 255),
                      Colors.white.withOpacity(1.0),
                      ],
                    ),
                    ),
                  ),
                  ),
                ),
        
                ],
              ),
        
              Column(
                children: [
        
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Hai Moviegoers!",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 7, 27, 118),
                      ),
                    ),
                    ),
                  ),
                  SizedBox(height: 10),
        
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Sudah siap merasakan pengalaman menonton yang tidak terlupakan?",
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 7, 27, 118),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 15),
        
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Email or WhatsApp Number",
                          style: TextStyle(fontSize: 16,
                          ),
                        ),
                    ),
                  ),
        
                  InputWidget1(),
        
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Password",
                          style: TextStyle(fontSize: 16,
                          ),
                        ),
                    ),
                  ),
        
                  InputWidget3(),
        
                  Row(
                    children: [
        
                      SizedBox(width: 10),
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                        },
                      ),
                      Text("Ya, saya menerima syarat dan ketentuan yang berlaku",
                        style: TextStyle(fontSize: 16,
                        ),
                      ),
        
                    ],
                  ),
                  SizedBox(height: 10),
        
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Forgot Password",
                          style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 7, 27, 118),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 10),
        
                ],
              ),
        
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 7, 27, 118),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50), // ukuran button sebesar layar
                        padding: const EdgeInsets.all(5), //untuk mengatur jarak antara text dan button/ padding
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context,'/dashboard'); //dipanggil di get_tekan
                      },
                      child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    ),
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Belum punya akun?",
                        style: TextStyle(fontSize: 16,
                        ),
                        ),
                        SizedBox(width: 5),

                        Text("Daftar di sini",
                        style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 7, 27, 118), fontWeight: FontWeight.bold
                        ),
                        ),

                      ],
                    ),
                    SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}