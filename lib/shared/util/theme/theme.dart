import 'package:flutter/material.dart';
import 'package:kafegama/shared/util/theme/theme_constants.dart';
import 'package:google_fonts/google_fonts.dart';

var defaultTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  cardTheme: CardTheme(
    elevation: 0.6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey[800],
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: primaryColor,
    titleTextStyle: const TextStyle(
      color: Colors.white,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    headline1: TextStyle(
      color: Colors.grey[800],
    ),
    headline2: TextStyle(
      color: Colors.grey[800],
    ),
    bodyText1: TextStyle(
      color: Colors.grey[800],
    ),
    bodyText2: TextStyle(
      color: Colors.grey[800],
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xFF6F35A5),
      shape: const StadiumBorder(),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF1E6FF),
    iconColor: Color(0xFF6F35A5),
    prefixIconColor: Color(0xFF6F35A5),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
);
