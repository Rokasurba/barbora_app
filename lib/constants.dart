// Padding
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  // Name
  static const String appName = "Barbora app";

  static const String API_URL = "asos2.p.rapidapi.com";
  static const String API_PRODUCT_LIST = "/products/v2/list";

  static const int stockPaginationLimit = 2;

  static const String StockStorageKey = "stocks";

  // Material Design Color
  static const Color lightPrimary = Color.fromRGBO(231, 17, 19, 1);
  // static Color lightAccent = Color(0xFF3B72FF);
  static const Color darkAccent = Color.fromRGBO(20, 33, 61, 1);
  // static Color lightBackground = Color(0xfffcfcff);
  static const Color lightBackground = Colors.white;
    // static Color lightAccent = Color(0xFF3B72FF);
  static const Color textPrimaryColor = Color.fromRGBO(20, 33, 61, 1);

  // Routes
  static const String initialRoute = '/';

  static ThemeData lighTheme(BuildContext context) {
    return ThemeData(
      backgroundColor: lightBackground,
      primaryColor: lightPrimary,
      accentColor: darkAccent,
      scaffoldBackgroundColor: lightBackground,
      textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
      appBarTheme: AppBarTheme(
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
