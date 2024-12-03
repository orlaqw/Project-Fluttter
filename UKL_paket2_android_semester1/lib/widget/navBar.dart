import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar(this.page);
  final int page;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  getPage(index){ //index untuk menyimpan nilai
    if (index == 0){ //diberi logika untuk perpindah halaman
      Navigator.pushReplacementNamed(context, '/movie');
    }else if (index == 1){
      Navigator.pushReplacementNamed(context, '/cinema');
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.white,
      selectedIndex: widget.page, //index yang dipilih
      onDestinationSelected: getPage,
      destinations: [

        NavigationDestination(
          icon: Container(
            width: 200, height: 50,
            child: Center(
              child: Text(
          "Movie",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.page == 0 ? Color.fromARGB(255, 7, 27, 118) : Colors.blueAccent,
          ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
          bottom: BorderSide(
            color: widget.page == 0 ? Color.fromARGB(255, 7, 27, 118) : Colors.blueAccent,
            width: 1,
          ),
              ),
            ),
          ),
          label: ' ',
        ),

        NavigationDestination(
          icon: Container(
            width: 200, height: 50,
            child: Center(
              child: Text(
          "Cinema",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.page == 1 ? Color.fromARGB(255, 7, 27, 118) : Colors.blueAccent,
          ),
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
          bottom: BorderSide(
            color: widget.page == 1 ? Color.fromARGB(255, 7, 27, 118) : Colors.blueAccent,
            width: 1,
          ),
              ),
            ),
          ),
          label: ' ',
        ),

      ],
    );
  }
}

