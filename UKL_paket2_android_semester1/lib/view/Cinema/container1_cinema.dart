import 'package:flutter/material.dart';

class Container1Cinema extends StatelessWidget {
  const Container1Cinema({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [

          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(

                title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      SizedBox(width: 5,),
                      Text("Malang Town Square", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                  children: [

                    Icon(Icons.location_on_outlined),
                    Text("8.03 km away", style: TextStyle(color: Colors.blueGrey, fontSize: 16),),

                  ],
                  ),
                  SizedBox(height: 10),

                  Row(
                  children: [

                    Icon(Icons.local_movies_outlined),
                    Text("REGULAR LUXE", style: TextStyle(color:Colors.blueGrey, fontSize: 16),),

                  ],
                  )

                ],
                ),
                
              ),
              ),

          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(

                title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      SizedBox(width: 5,),
                      Text("Lippo Plaza Batu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                  children: [

                    Icon(Icons.location_on_outlined),
                    Text("11.23 km away", style: TextStyle(color: Colors.blueGrey, fontSize: 16),),

                  ],
                  ),
                  SizedBox(height: 10),

                  Row(
                  children: [

                    Icon(Icons.local_movies_outlined),
                    Text("REGULAR", style: TextStyle(color:Colors.blueGrey, fontSize: 16),),

                  ],
                  )

                ],
                ),
                
              ),
              ),

            ],
            ),

    );
  }
}