import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/view/Cinema/appBar_cinema.dart';
import 'package:latihan_ukl_paket1android/view/Login/login_cinepolis.dart';
import 'package:latihan_ukl_paket1android/view/Movie/appBar_movie.dart';
import 'package:latihan_ukl_paket1android/view/MyBooking/appBar_myBooking.dart';
import 'package:latihan_ukl_paket1android/view/Dashboard/appBar_dashboard.dart';
import 'package:latihan_ukl_paket1android/view/splashScreen.dart';

void main() {  
runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget {//scaffold dan materialapp tidak boleh dobel/ didalamnya scaffold dan materialapp
  const MyApp({Key? key}) :super(key: key); 

// This widget is the root of your application.  
@override

Widget build(BuildContext context) {  
  return MaterialApp(
    initialRoute: '/splashScreen', //initial route adalah awal yg terbuka
      routes: { //routing untuk menentukan alamat halaman bisa disebut url
        '/splashScreen': (context) => SplashScreen(),
        '/login': (context) => LoginCinepolis(),
        '/dashboard': (context) => AppbarDashboard(),
        '/myBooking': (context) => AppbarMybooking(),
        '/movie': (context) => AppbarMovie(),
        '/cinema': (context) => AppbarCinema(),
      },
    title: "Cinepolis",
    home: SplashScreen(),
    );
  } 
}  