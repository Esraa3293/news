import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFF39A552);
  static const Color redColor = Color(0xFFC91C22);
  static const Color darkBlueColor = Color(0xFF003E90);
  static const Color pinkColor = Color(0xFFED1E79);
  static const Color brownColor = Color(0xFFCF7E48);
  static const Color lightBlueColor = Color(0xFF4882CF);
  static const Color yellowColor = Color(0xFFF2D352);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: primaryColor,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)
            )
        ),
      )
  );
}