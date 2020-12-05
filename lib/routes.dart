import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'custom_route.dart';
import 'hotel_booking/info_screen.dart';

class Routing {
  // static String userValue;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/info_screen':
        return CustomRoute(builder: (_) => InfoScreen());
        break;
      case '/login':
        return CustomRoute(builder: (_) => Login());
        break;
      default:
        return null;
    }
  }
}
