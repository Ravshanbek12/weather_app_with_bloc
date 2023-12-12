import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer( const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed('/weather');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color:const Color(0xFFD6996B),
        child:  const Center(
          child: Text("Weather App",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
        )
      ),
    );
  }
}
