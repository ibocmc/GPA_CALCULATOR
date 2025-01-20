import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static const MaterialColor mainColor = Colors.indigo;
  static const String titleText = "Grade Point Average";
  
  static final TextStyle titleStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final TextStyle headTextStyle = GoogleFonts.quicksand(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static final TextStyle head2TextStyle = GoogleFonts.quicksand(
    fontSize: 48,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );
  static const BorderRadius dropDownRadius =
      BorderRadius.all(Radius.circular(24));
}
