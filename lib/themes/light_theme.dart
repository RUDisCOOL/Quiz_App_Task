import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  textTheme: GoogleFonts.outfitTextTheme(ThemeData.light().textTheme),
  // scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.green,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.blue.shade50,
    onSurface: Colors.black,
    tertiary: Colors.grey.shade200,
    onTertiary: Colors.white,
  ),
  // primaryColor: Colors.red,
);
