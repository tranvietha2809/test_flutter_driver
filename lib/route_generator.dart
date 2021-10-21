import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_driver/routes.dart';
import 'package:test_flutter_driver/screens/home/home_page.dart';
import 'package:test_flutter_driver/screens/login/login_page.dart';
import 'package:test_flutter_driver/screens/splash/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final data = settings.arguments;
    switch(settings.name){
      case LOGIN:
        return LoginPage.route();
      case HOME:
        return HomePage.route();
      default:
        return SplashPage.route();
    }
  }
}