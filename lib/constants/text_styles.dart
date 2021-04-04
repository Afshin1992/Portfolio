import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/fonts.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get heading => TextStyle(
        fontFamily: Fonts.nexa_bold,
        color: Colors.white,
        fontSize: 25.0, //45.0
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );
  static TextStyle get title => TextStyle(
        fontFamily: Fonts.nexa_bold,
        color: Color(0xFF50AFC0),
        fontSize: 25.0, //45.0
        fontWeight: FontWeight.w600,
        letterSpacing: 8.0,
      );

  static TextStyle get sub_heading => TextStyle(
        color: Colors.white,
        fontFamily: Fonts.product,
        fontSize: 18.0, //17.0
        letterSpacing: 1.2,
      );

  static TextStyle get company => TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF45405B),
        height: 1.7,
        fontSize: 15.0, //15.0
        letterSpacing: 1.0,
      );

  static TextStyle get body => TextStyle(
        fontFamily: Fonts.product,
        color: Colors.white,
        height: 1.7,
        fontSize: 15.0, //12.0
        letterSpacing: 1.0,
      );

  static TextStyle get body1 => TextStyle(
        fontFamily: Fonts.product,
        color: Colors.white,
        height: 1.5,
        fontSize: 10.0, //10.0
        letterSpacing: 1.0,
      );

  static TextStyle get chip => TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF85819C),
        height: 1.5,
        fontSize: 12.0, //12.0
        letterSpacing: 1.0,
      );
}
