import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/view/Dashboard/container1_dashboard.dart';
import 'package:latihan_ukl_paket1android/view/Dashboard/container2_dashboard.dart';
import 'package:latihan_ukl_paket1android/view/Dashboard/container3_dashboard.dart';
import 'package:latihan_ukl_paket1android/view/Dashboard/container4_dashboard.dart';
import 'package:latihan_ukl_paket1android/widget/botNav_cinepolis.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
          
            children: [
          
              Container1Dashboard(),
              Container2Dashboard(),
              Container3Dashboard(),
              Container4Dashboard(),
              
          
            ],
            
          ),
        ),
      ),

      bottomNavigationBar: BottomNavCinepolis(0),

    );
  }
}