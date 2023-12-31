import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();
const int pageLimit = 10;
const String kFavorites = 'favorites2';

final lightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme().copyWith(color: kPrimaryColor),
  dividerColor: Colors.white54,
  fontFamily: 'Cairo',
  colorScheme: ColorScheme.fromSwatch(primarySwatch: kPrimaryColor)
      .copyWith(secondary: kPrimaryColor)
      .copyWith(background: const Color(0xFFE5E5E5)),
);

final darkTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme().copyWith(color: kPrimaryColor),
  dividerColor: Colors.black12,
  fontFamily: 'Cairo',
  colorScheme: ColorScheme.fromSwatch(
          primarySwatch: kPrimaryColor, brightness: Brightness.dark)
      .copyWith(secondary: Colors.white)
      .copyWith(background: const Color(0xFF212121)),
);

const Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

// styles
const MaterialColor kPrimaryColor = MaterialColor(0xFF4CAF50, color);
const MaterialColor kSecondaryColor = MaterialColor(0xfffacc2f, color);
