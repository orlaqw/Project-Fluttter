import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the homepage after 3 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splashCinepolis.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.network(
                'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/5c/88/ad/5c88ad8e-45c1-d28e-c126-93370fcca4ff/AppIcon-0-0-1x_U007emarketing-0-7-0-sRGB-85-220.png/256x256bb.jpg', // Replace with your network image URL
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}