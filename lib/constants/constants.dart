import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConstants {
  static const Color mainColor = Colors.indigoAccent;
  static final textFormColor = mainColor.withOpacity(0.3);
}

class TextConstants {
  static const String mainText = "";


  static final TextStyle mainTextStyle = GoogleFonts.quicksand(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: ColorConstants.mainColor);

  static final TextStyle totalPriceStyle = GoogleFonts.quicksand(
      fontSize: 70,
      fontWeight: FontWeight.w600,
      color: ColorConstants.mainColor);

  static final TextStyle productNumberStyle = GoogleFonts.quicksand(
      fontSize: 50,
      fontWeight: FontWeight.w600,
      color: ColorConstants.mainColor);

  static final TextStyle addCartTextStyle = GoogleFonts.quicksand(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorConstants.mainColor);
}

class DecorationConstants {
  static BorderRadius borderRadius = BorderRadius.circular(24);
}
