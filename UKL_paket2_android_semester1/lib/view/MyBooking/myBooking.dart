import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/view/MyBooking/container1_myBooking.dart';
import 'package:latihan_ukl_paket1android/widget/botNav_cinepolis.dart';

class Mybooking extends StatelessWidget {
  const Mybooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 206, 206, 206),
        child: SingleChildScrollView(
          child: Column(
          
            children: [
          
              Container1Mybooking(),
          
            ],
            
          ),
        ),
      ),

      bottomNavigationBar: BottomNavCinepolis(1),
    );
  }
}