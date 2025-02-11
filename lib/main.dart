import 'package:flutter/material.dart';
import 'package:movie_app/views/register_user_view.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => RegisterUserView(),
    },
  ));
}
