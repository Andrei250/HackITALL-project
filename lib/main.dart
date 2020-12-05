import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackitallproj/auth/login.dart';
import 'package:hackitallproj/custom_drawer/home_drawer.dart';
import 'package:hackitallproj/routes.dart';
import 'app_theme.dart';
import 'hotel_booking/home.dart';
import 'hotel_booking/hotel_home_screen.dart';
import 'navigation_home_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Login(),
      theme: AppTheme.darkTheme,
      // initialRoute: '/',
      onGenerateRoute: Routing.generateRoute,
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
