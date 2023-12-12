
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presenter/screens/basic.dart';
import '../presenter/screens/splash.dart';



abstract class AppRouts{
  static Route<dynamic> router(RouteSettings routeSettings){
    switch(routeSettings.name){
      case '/':
        return CupertinoPageRoute(builder: (_)=>const SplashScreen());

      case '/weather':
        return CupertinoPageRoute(builder: (_)=>const BasicScreen());

      default:
        return CupertinoPageRoute(builder: (_)=>const Scaffold());
    }
  }
}