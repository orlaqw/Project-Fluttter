import 'package:flutter/material.dart';
import 'package:latihan_ukl_paket1android/view/Dashboard/dashboard.dart';
import 'package:latihan_ukl_paket1android/widget/lokasi.dart';

class AppbarDashboard extends StatelessWidget {
  const AppbarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,//menghilangkan icon back arrow
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey,

        title: Lokasi(),

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

          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_outlined, color: Color.fromARGB(255, 7, 27, 118)),),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_rounded, color: Color.fromARGB(255, 7, 27, 118),),),
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle, color: Color.fromARGB(255, 7, 27, 118),),),
          SizedBox(width: 10),

        ],
      ),

      body: Dashboard(),

    );
  }
}
