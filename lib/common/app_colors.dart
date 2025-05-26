import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF000000); //Color(0xFF0F632D)
  static const Color secondary = Color(0xFF051f17);
  static const Color secondaryDark = Color.fromRGBO(84, 197, 248, 1);

  // Common colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color.fromARGB(200, 218, 212, 212);
  static const Color greyHeader = Color(0xFF99AABE);
  static const Color transparent = Colors.transparent;
  static const MaterialColor darkGrey = Colors.grey;
  static const MaterialColor blue = Colors.blue;
  static const MaterialColor orange = Colors.orange;
  static const Color errorLight = Color(0xFFc4204e);
  static const Color greyHintColor = Color(0xFF696969);
  static const Color red = Color(0xFFFF0303);
  static Color textSelectionColor = greyHintColor.withAlpha(
    (0.5 * 255).toInt(),
  );
}
