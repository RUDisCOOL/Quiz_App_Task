import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme),
  // scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.green.shade800,
    onSecondary: Colors.grey.shade100,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.blueGrey.shade800,
    onSurface: Colors.white,
    tertiary: Colors.grey.shade200,
    onTertiary: Colors.black,
  ),
  // primaryColor: Colors.red,
);
