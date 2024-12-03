import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/view/Movie/container1_movie.dart';
import 'package:latihan_ukl_paket1android/widget/botNav_cinepolis.dart';

class Movie extends StatelessWidget {
  const Movie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
          
            children: [
          
              Container1Movie(),
             
            ],
            
          ),
        ),
      ),

      bottomNavigationBar: BottomNavCinepolis(2),

    );
  }
}