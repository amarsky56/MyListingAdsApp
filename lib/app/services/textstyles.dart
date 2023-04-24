import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myrealty/app/services/colors.dart';
import 'responsive_size.dart';

class TextStyleUtil {
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;

  TextStyleUtil({
    this.color = Colors.black,
    this.fontsize = 24,
    this.fontWeight = FontWeight.w600,
  });

  static TextStyle ralewayStyleS14W500({
    //NimbusSanL
    Color color = ColorUtil.brandColor1,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 14.kh,
        fontWeight: fontWeight,
      ),
    );
  }
  static TextStyle txt40_6({
    //NimbusSanL
    Color color = ColorUtil.brandColor1,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 40.kh,
        fontWeight: fontWeight,
      ),
    );
  }
  static TextStyle txt32_6({
    //NimbusSanL
    Color color = ColorUtil.brandColor1,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 32.kh,
        fontWeight: fontWeight,
      ),
    );
  }
  static TextStyle txt12_4({
    //NimbusSanL
    Color color = ColorUtil.brandColor1,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 12.kh,
        fontWeight: fontWeight,
      ),
    );
  }
  static TextStyle txt16_4({
    //NimbusSanL
    Color color = ColorUtil.brandColor1,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 16.kh,
        fontWeight: fontWeight,
      ),
    );
  }
  static TextStyle txt24_7({
    //NimbusSanL
    Color color = ColorUtil.kprimaryblack,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 24.kh,
        fontWeight: fontWeight,
      ),
    );
  }
  static TextStyle txt34_7({
    //NimbusSanL
    Color color = ColorUtil.kprimaryblack,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 34.kh,
        fontWeight: fontWeight,
      ),
    );
  }
  static TextStyle txt15_6({
    //NimbusSanL
    Color color = ColorUtil.kdark,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 15.kh,
        fontWeight: fontWeight,
      ),
    );
  }
  static TextStyle txt11_6({
    //NimbusSanL
    Color color = ColorUtil.kdark,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.raleway(
      textStyle: TextStyle(
        color: color,
        fontSize: 11.kh,
        fontWeight: fontWeight,
      ),
    );
  }
}
