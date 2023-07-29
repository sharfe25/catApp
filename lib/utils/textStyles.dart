import 'package:flutter/material.dart';

TextStyle containTextStyle({double fontSize = 15, Color color = const Color.fromARGB(255, 0, 0, 0)}) {
  return TextStyle(
      color: color,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
      fontSize: fontSize);
}

TextStyle titleTextStyle({double fontSize = 16, Color color = Colors.white, }) {
  return TextStyle(
      color: color,
      fontFamily: 'Nunito',
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
      decoration: TextDecoration.none);
}
