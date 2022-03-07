import 'package:flutter/material.dart';

BorderRadius borderRadius = BorderRadius.circular(6);
double get padding => 16;
TextStyle titleTextStyle(
    {double fontSize = 25,
    Color color = Colors.black,
    required BuildContext context}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
      letterSpacing: 1.8);
}
