import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/view/MyBooking/myBooking.dart';

class AppbarMybooking extends StatelessWidget {
  const AppbarMybooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,//menghilangkan icon back arrow
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,

        title: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("My Booking", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ),

        // title: Container( 
        //   margin: EdgeInsets.all(10),
        //   padding: EdgeInsets.all(5),
        //   width: 135,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.blueGrey),
        //   ),
        //   child: Row(
        //     children: [
        //       Icon(Icons.location_on, color: Colors.blueGrey),
        //       SizedBox(width: 5),
        //       Text("Malang", style: TextStyle(color: Colors.blueGrey, fontSize: 16)),
        //       IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey))
        //     ],
        //   ),
        // ),

        actions: [

          IconButton(onPressed: () {}, icon: Icon(Icons.timer_outlined,),),
          SizedBox(width: 10),

        ],
      ),

      body: Mybooking(),


    );
  }
}