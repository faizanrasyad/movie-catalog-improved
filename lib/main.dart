import 'package:flutter/material.dart';
import 'package:katalog_film/movies.dart';
import 'package:katalog_film/login.dart';
import 'package:katalog_film/profile.dart';
import 'package:katalog_film/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Katalog Film',
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScren(),
      '/login': (context) => Login(),
      '/movie': (context) => Movies(),
      '/profile': (context) => Profile()
    },
    debugShowCheckedModeBanner: false,
  ));
}
