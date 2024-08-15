import 'dart:async';
import 'package:flutter/material.dart';
import 'package:katalog_film/login.dart';

class SplashScren extends StatefulWidget {
  @override
  _SplashScrenState createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(color: Colors.white, child: Image.asset('assets/movie.jpg')),
        Container(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ); //FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
