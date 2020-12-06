import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Color.fromRGBO(37, 34, 35, 1);
  static const Color primaryVariantColor = Color.fromRGBO(69, 73, 85, 1);
  static const Color lightColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color accentColor = Color.fromRGBO(114, 176, 29, 1);
  static const Color secondaryAccentColor = Color.fromRGBO(63, 125, 32, 1);
  static const Color lightAccent = Color.fromRGBO(84, 211, 194, 1);
//  static const Color lightAccent = Color.fromRGBO(0, 204, 150, 1);
  static const Color lightGradient = Color.fromRGBO(0, 179, 131, 1);

  static final ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: 'quicksand', color: primaryColor, fontSize: 40.0),
      headline2: TextStyle(
          fontFamily: 'quicksand', color: primaryColor, fontSize: 25.0),
      headline3: TextStyle(
          fontFamily: 'quicksand', color: primaryColor, fontSize: 20.0),
      subtitle1: TextStyle(
          fontFamily: 'quicksand', color: primaryColor, fontSize: 15.0),
      subtitle2: TextStyle(
          fontFamily: 'quicksand', color: primaryColor, fontSize: 10.0),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: AppBarTheme(
      color: secondaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.lightBlueAccent,
      onPrimary: Colors.lightBlue,
      primaryVariant: Colors.lightBlueAccent,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.lightBlue,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: 'quicksand', color: lightColor, fontSize: 40.0),
      headline2: TextStyle(
          fontFamily: 'quicksand', color: lightColor, fontSize: 25.0),
      headline3: TextStyle(
          fontFamily: 'quicksand', color: lightColor, fontSize: 20.0),
      subtitle1: TextStyle(
          fontFamily: 'quicksand', color: lightColor, fontSize: 15.0),
      subtitle2: TextStyle(
          fontFamily: 'quicksand', color: lightColor, fontSize: 10.0),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      buttonColor: lightColor,
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   enabledBorder: new OutlineInputBorder(
    //     borderRadius: new BorderRadius.circular(25.0),
    //     borderSide: BorderSide(
    //       color: AppTheme.primaryVariantColor,
    //     ),
    //   ),
    //   focusedBorder: new OutlineInputBorder(
    //     borderRadius: new BorderRadius.circular(25.0),
    //     borderSide: BorderSide(
    //       color: AppTheme.lightColor,
    //       width: 1.5,
    //     ),
    //   ),
    // ),
  );

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

}

final eLabel = TextStyle(
  color: Colors.grey[600],
  fontWeight: FontWeight.normal,
  fontFamily: 'quicksand',
);
final eLabelFocused = TextStyle(
  color: AppTheme.lightAccent,
  fontWeight: FontWeight.bold,
  fontFamily: 'quicksand',
);

final eLabelError = TextStyle(
  color: Colors.red[700],
  fontWeight: FontWeight.bold,
  fontFamily: 'quicksand',
);

final eWarning = TextStyle(
  color: Colors.red[700],
  fontFamily: 'quicksand',
  fontSize: 15,
);
final eWarningSmall = TextStyle(
  color: Colors.red[700],
  fontFamily: 'quicksand',
  fontSize: 10,
);
final eButton = TextStyle(
  color: Colors.white,
  fontFamily: 'quicksand',
  fontSize: 17,
);

final eProduct = TextStyle(
  color: AppTheme.primaryColor,
  fontFamily: 'quicksand',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final eNavBarText = TextStyle(
  color: AppTheme.lightAccent,
  fontFamily: 'quicksand',
  fontSize: 15.0,
);

final eStatsText = TextStyle(
  color: AppTheme.lightColor,
  fontFamily: 'quicksand',
  fontSize: 15.0,
);

final eStreet = TextStyle(
  color: AppTheme.lightColor,
  fontFamily: 'quicksand',
  fontSize: 20.0,
);
final eAcceptButton = TextStyle(
  color: Colors.white,
  fontFamily: 'quicksand',
  fontSize: 15.0,
);
final eStats = TextStyle(
  color: Colors.grey[600],
  fontFamily: 'quicksand',
  fontSize: 15.0,
);
final eDeclineButton = TextStyle(
  color: Colors.black,
  fontFamily: 'quicksand',
  fontSize: 15.0,
);
final eSeeAll = TextStyle(
  color: AppTheme.lightAccent,
  fontFamily: 'quicksand',
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
);

final eWelcome = TextStyle(
  color: Colors.grey[500],
  fontFamily: 'quicksand',
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);
final eProducts = TextStyle(
  color: Colors.white,
  fontFamily: 'quicksand',
  fontSize: 17.0,
);

final eWelcomeName = TextStyle(
  color: Colors.black,
  fontFamily: 'quicksand',
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);
final eTitle = TextStyle(
  color: Colors.black,
  fontFamily: 'quicksand',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
final eGrey = TextStyle(
  color: Colors.grey[300],
  fontFamily: 'quicksand',
  fontSize: 15.0,
);
final eTextField = TextStyle(
  color: Colors.black,
  fontFamily: 'quicksand',
  fontSize: 17.0,
);

final eName = TextStyle(
  color: Colors.grey[500],
  fontFamily: 'quicksand',
  fontSize: 20.0,
);