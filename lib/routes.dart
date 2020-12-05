import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'custom_route.dart';
import 'hotel_booking/home.dart';
import 'hotel_booking/info_screen.dart';

class Routing {
  // static String userValue;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/info_screen':
        return CustomRoute(builder: (_) => InfoScreen(data: settings.arguments,));
        break;
      case '/home':
        return CustomRoute(builder: (_) => Home());
        break;
      case '/login':
        return CustomRoute(builder: (_) => Login());
        break;
      case '/home':
        return CustomRoute(builder: (_) => HomeHome());
        break;
      default:
        return null;
    }
  }
}
