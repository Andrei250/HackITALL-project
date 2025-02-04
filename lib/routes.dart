import 'package:flutter/material.dart';
import 'package:hackitallproj/custom_drawer/home_drawer.dart';
import 'package:hackitallproj/find_persons/search_person.dart';
import 'package:hackitallproj/navigation_home_screen.dart';
import 'package:hackitallproj/user/notifications.dart';
import 'auth/login.dart';
import 'custom_route.dart';
import 'rooms.dart';
import 'hotel_booking/info_screen.dart';

class Routing {
  // static String userValue;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/info_screen':
        return CustomRoute(
            builder: (_) => InfoScreen(
                  data: settings.arguments,
                ));
        break;
      case '/login':
        return CustomRoute(builder: (_) => Login());
        break;
      case '/home_page':
        return CustomRoute(builder: (_) => NavigationHomeScreen());
        break;
      case '/rooms':
        return CustomRoute(builder: (_) => Rooms(data: settings.arguments,));
        break;
      case '/search_people':
        return CustomRoute(builder: (_) => SearchPerson());
        break;
      case '/notifications':
        return CustomRoute(builder: (_) => Notifications());
        break;
      default:
        return null;
    }
  }
}
