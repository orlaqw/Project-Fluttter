import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Container3Dashboard extends StatefulWidget {
  const Container3Dashboard({super.key});

  @override
  State<Container3Dashboard> createState() => _Container3DashboardState();
}

class _Container3DashboardState extends State<Container3Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(

        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

            Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Up Coming", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 7, 27, 118),
                          ),
                        ),
                    ),
                  ),

            Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("See All", style: TextStyle(fontSize: 16, color: Colors.blueGrey,
                          ),
                        ),
                    ),
                  ),

            ],

          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
              
                children: [
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage("https://asset.tix.id/wp-content/uploads/2024/11/5892720d-2efd-46ca-9c4f-e5cb5ca29505-600x885.webp"), height: 225, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage("https://studio.mrngroup.co/storage/app/media/Prambors/Editorial%204/moana%202-20241128171109.webp?tr=w-600"), height: 225, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage("https://asset.tix.id/wp-content/uploads/2024/11/bbc3f2cd-8063-4b83-bc80-d251d9c1fefc-600x885.webp"), height: 225, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtVZOvzdt4rHS51PfvTrUHij0_LbT_H9LCRw&s"), height: 225, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage("https://asset.tix.id/wp-content/uploads/2024/11/b2ff8ae9-3e45-4824-ac73-6b607312aea7-600x885.webp"), height: 225, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),

                ],
              
              ),
            ),
          
          ),
          // SizedBox(height: 10,),

          //   CarouselSlider(
          //   options: CarouselOptions(
          //     height: 225,
          //     enlargeCenterPage: true,
          //     enableInfiniteScroll: true,
          //     autoPlay: true,
          //     viewportFraction: 0.3, // Adjust this value to change the spacing between images
          //   ),
          //   items: [
          //     "https://asset.tix.id/wp-content/uploads/2024/11/5892720d-2efd-46ca-9c4f-e5cb5ca29505-600x885.webp",
          //     "https://studio.mrngroup.co/storage/app/media/Prambors/Editorial%204/moana%202-20241128171109.webp?tr=w-600",
          //     "https://asset.tix.id/wp-content/uploads/2024/11/bbc3f2cd-8063-4b83-bc80-d251d9c1fefc-600x885.webp",
          //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtVZOvzdt4rHS51PfvTrUHij0_LbT_H9LCRw&s",
          //     "https://asset.tix.id/wp-content/uploads/2024/11/b2ff8ae9-3e45-4824-ac73-6b607312aea7-600x885.webp",
          //   ].map((i) {
          //     return Builder(
          //     builder: (BuildContext context) {
          //       return Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 5.0), // Adjust this value to change the spacing between images
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(10),
          //         child: Image.network(i, fit: BoxFit.cover),
          //       ),
          //       );
          //     },
          //     );
          //   }).toList(),
          //   ),

        ],

      ),
      
    );
  }
}