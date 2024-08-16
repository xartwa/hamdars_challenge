import 'package:flutter/material.dart';

const String appFont = 'IranYekan';

class AppColors {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static const Color lightGray = Color(0xFFEDEDED);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGray = Color(0xFF404040);
  static const Color primaryBlue = Color(0xFF758BEB);
  static const Color accentYellow = Color(0xFFFFC107);
  static const Color secondaryTeal = Color(0xFF0CBABA);
  static const Color darkTeal = Color(0xFF00898A);
  static const Color softBlue = Color(0xFFA7BAFF);
  static const Color lightestGray = Color(0xFFF0F0F0);
}

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: appFont,
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.white,
  
  );
}
