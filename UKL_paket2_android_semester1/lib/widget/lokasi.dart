import 'package:flutter/material.dart';

class Lokasi extends StatelessWidget {
  const Lokasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 150,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.blueGrey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 5),
                  Icon(Icons.location_on_outlined, color: Colors.blueGrey),
                  Text("Malang", style: TextStyle(color: Colors.blueGrey, fontSize: 16)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey)),
                ],
              ),
            ),
          );
  }
}