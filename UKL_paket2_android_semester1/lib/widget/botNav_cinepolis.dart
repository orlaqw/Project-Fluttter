import 'package:flutter/material.dart';

class BottomNavCinepolis extends StatefulWidget {
  BottomNavCinepolis(this.page);
  int page;

  @override
  State<BottomNavCinepolis> createState() => _BotnavPerlutukangState();
}

class _BotnavPerlutukangState extends State<BottomNavCinepolis> {

  getPage(index){ //index untuk menyimpan nilai
    if (index == 0){ //diberi logika untuk perpindah halaman
      Navigator.pushReplacementNamed(context, '/dashboard');
    }else if (index == 1){
      Navigator.pushReplacementNamed(context, '/myBooking');
    }else if (index == 2){
      Navigator.pushReplacementNamed(context, '/movie');
    }else if (index == 3){
      Navigator.pushReplacementNamed(context, '/cinema');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 7, 27, 118),
        unselectedItemColor: Colors.blueGrey,
        currentIndex:widget.page, //index yang dipilih
        onTap: getPage,
        items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: 'Home',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_outlined),
            activeIcon: Icon(Icons.local_movies),
            label: 'My Booking',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            activeIcon: Icon(Icons.tv_rounded),
            label: 'Movie',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            activeIcon: Icon(Icons.movie),
            label: 'Cinema',
            ),
          
        ],
      );
  }
}