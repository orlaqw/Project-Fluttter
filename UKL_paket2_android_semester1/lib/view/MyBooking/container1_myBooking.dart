import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Container1Mybooking extends StatefulWidget {
  const Container1Mybooking({super.key});

  @override
  State<Container1Mybooking> createState() => _Container1MybookingState();
}

class _Container1MybookingState extends State<Container1Mybooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          
          Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("There's no active booking!", style: TextStyle(fontSize: 14,
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 10,),

            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk03uAanY0CIU956E-_1Ya0IDRAtO-VJFdaaBR2bY05LfnmSLaoQMg5eeQwLTUuOxa4eE&usqp=CAU"), width: 230, height: 125, fit: BoxFit.cover,),
                    ),

                    SizedBox(width: 25,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    
                        Text(
                          'GLADIATOR II',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 10,),

                        Row(
                          children: [

                            Container(
                              padding: EdgeInsets.all(1),
                              color: const Color.fromARGB(255, 212, 212, 212),
                              child: Text("D 17+", style: TextStyle(color: Colors.red),),
                            ),
                            SizedBox(width: 10,),

                            Text("Action, Adventure", style: TextStyle(color: Colors.grey),),

                          ],
                        ),
                        SizedBox(height: 10,),

                        Row(
                          children: [

                            Icon(Icons.star, color: Colors.amber, size: 15,),
                            Icon(Icons.star, color: Colors.amber, size: 15,),
                            Icon(Icons.star, color: Colors.amber, size: 15,),
                            Icon(Icons.star, color: Colors.amber, size: 15,),
                            Icon(Icons.star_half, color: Colors.amber, size: 15,),
                            SizedBox(width: 5,),
                            Text("9.5", style: TextStyle(fontSize: 15, color: Colors.amber),)

                          ],
                        )

                      ],
                    ),
                
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdtor0zLCXAyr6ezjOCHojGgVH27RkaOfsdCoJCOhcPzfe1l8z0lkh94SQazJu99k1lq4&usqp=CAU"), width: 230, height: 125, fit: BoxFit.cover,),
                    ),

                    SizedBox(width: 25,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    
                        Text(
                          'RED ONE',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 10,),

                        Row(
                          children: [

                            Container(
                              padding: EdgeInsets.all(1),
                              color: const Color.fromARGB(255, 212, 212, 212),
                              child: Text("D 13+", style: TextStyle(color: Colors.blueGrey),),
                            ),
                            SizedBox(width: 10,),

                            Text("Action, Adventure", style: TextStyle(color: Colors.grey),),

                          ],
                        ),
                        SizedBox(height: 10,),

                        Row(
                          children: [

                            Icon(Icons.star, color: Colors.amber, size: 15,),
                            Icon(Icons.star, color: Colors.amber, size: 15,),
                            Icon(Icons.star, color: Colors.amber, size: 15,),
                            Icon(Icons.star, color: Colors.amber, size: 15,),
                            Icon(Icons.star_half, color: Colors.amber, size: 15,),
                            SizedBox(width: 5,),
                            Text("9.3", style: TextStyle(fontSize: 15, color: Colors.amber),)

                          ],
                        )

                      ],
                    ),
                
                  ],
                ),
              ),
            ),

        ],
      ),
    );
  }
}