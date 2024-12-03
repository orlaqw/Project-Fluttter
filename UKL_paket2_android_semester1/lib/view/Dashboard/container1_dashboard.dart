import 'package:flutter/material.dart';

class Container1Dashboard extends StatelessWidget {
  const Container1Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(

        children: [
          
          Row(
            children: [

              SizedBox(width: 10,),
              Text("Hello, ",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                    ),
                  ),

              Text("Guest",
                    style: TextStyle(fontSize: 16,
                    ),
                  ),

            ],
          ),
          SizedBox(height: 10),
          
          Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Kamu mau nonton apa hari ini?",
                          style: TextStyle(fontSize: 16,
                          ),
                        ),
                    ),
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
                    child: Image(image: NetworkImage("https://eyntk.info/wp-content/uploads/2024/02/Moana-2-announcement-during-Disney-Earnings-Call.jpg"), width: 400, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage("https://awsimages.detik.net.id/community/media/visual/2024/10/28/guna-guna-istri-muda_169.jpeg?w=1200"), width: 400, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage("https://cdn1.katadata.co.id/media/images/thumb/2024/11/20/Sinopsis_Film_Negeri_Para_Ketua-2024_11_20-10_58_45_fc252abdc7e50998c935c2a357aee7a7_960x640_thumb.jpg"), width: 400, height: 226, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),

                ],
              
              ),
            ),
          
          ),

        ],

      ),
    );
  }
}