import 'package:flutter/material.dart';

class Container1Movie extends StatefulWidget {
  const Container1Movie({super.key});

  @override
  State<Container1Movie> createState() => _Container1MovieState();
}

class _Container1MovieState extends State<Container1Movie> {
  TextEditingController tombol = TextEditingController();

  var tekan = '';

  get_tombol(){
    setState(() { 
      tekan = tombol.text;
    });
  }

  var _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(

        children: [

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [

                  Row(
                  
                    children: [
                      
                      Column(
                        children: [
                  
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqsjwgekj9azQpg2ML2znpkXNU8zyAIKnMZg&s"), height: 225, width: 150, fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10,),
                  
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text("Wicked (SU)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 7, 27, 118),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              fixedSize: Size(150, 40), //untuk mengatur ukuran button
                              padding: const EdgeInsets.all(10), //untuk mengatur jarak antara text dan button/ padding
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                            ),
                            onPressed: () {
                            get_tombol(); //dipanggil di get_nama
                            },
                            child: Text('Buy Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                          )
                  
                        ],
                      ),
                      SizedBox(width: 20,),
                  
                      Column(
                        children: [
                  
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(image: NetworkImage("https://studio.mrngroup.co/storage/app/media/Prambors/Editorial%204/moana%202-20241128171109.webp?tr=w-600"), height: 225, width: 150, fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10,),
                  
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text("Moana 2 (SU)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 7, 27, 118),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              fixedSize: Size(150, 40), //untuk mengatur ukuran button
                              padding: const EdgeInsets.all(10), //untuk mengatur jarak antara text dan button/ padding
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                            ),
                            onPressed: () {
                            get_tombol(); //dipanggil di get_nama
                            },
                            child: Text('Buy Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                          )
                  
                        ],
                      ),
                      SizedBox(width: 10,),

                    ],
                  
                  ),
                  SizedBox(height: 20,),

                  Row(
                  
                    children: [
                      
                      Column(
                        children: [
                  
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(image: NetworkImage("https://awsimages.detik.net.id/community/media/visual/2024/11/08/red-one-2_34.png?w=1200&q=90"), height: 225, width: 150, fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10,),
                  
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text("Red One (13+)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 7, 27, 118),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              fixedSize: Size(150, 40), //untuk mengatur ukuran button
                              padding: const EdgeInsets.all(10), //untuk mengatur jarak antara text dan button/ padding
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                            ),
                            onPressed: () {
                            get_tombol(); //dipanggil di get_nama
                            },
                            child: Text('Buy Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                          )
                  
                        ],
                      ),
                      SizedBox(width: 20,),
                  
                      Column(
                        children: [
                  
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtVZOvzdt4rHS51PfvTrUHij0_LbT_H9LCRw&s"), height: 225, width: 150, fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10,),
                  
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text("Gladiator II (17+)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 7, 27, 118),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              fixedSize: Size(150, 40), //untuk mengatur ukuran button
                              padding: const EdgeInsets.all(10), //untuk mengatur jarak antara text dan button/ padding
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, //untuk mengatur ukuran button
                            ),
                            onPressed: () {
                            get_tombol(); //dipanggil di get_nama
                            },
                            child: Text('Buy Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                          )
                  
                        ],
                      ),
                      SizedBox(width: 10,),

                    ],
                  
                  ),
                  
                ],
              ),
            ),
          
          ),
          
        ],

      ),
      ),
      
    );
  }
}