import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/view/Cinema/cinema.dart';
import 'package:latihan_ukl_paket1android/widget/navBar.dart';
import 'package:latihan_ukl_paket1android/widget/input_widget2.dart';
import 'package:latihan_ukl_paket1android/widget/lokasi.dart';

class AppbarCinema extends StatelessWidget {
  const AppbarCinema({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(220),
        child: AppBar(
          automaticallyImplyLeading: false,//menghilangkan icon back arrow
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueGrey,
        
            flexibleSpace: Positioned(
            left: 0,
            bottom: 0,
            top: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 7,),
                    Lokasi(),
                  ],
                ),
                InputWidget2(),
                NavBar(1),

              ],
            ),
            ),

        ),
      ),

      body: Cinema(),

    );
  }
}
