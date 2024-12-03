import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/view/Cinema/container1_cinema.dart';
import 'package:latihan_ukl_paket1android/widget/botNav_cinepolis.dart';

class Cinema extends StatelessWidget {
  const Cinema({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
          
            children: [
          
              SizedBox(height: 10,),
              Container1Cinema(),
          
            ],
            
          ),
        ),
      ),

      bottomNavigationBar: BottomNavCinepolis(3),
    );
  }
}