import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


ThemeData getAppTheme(){

  return ThemeData(
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.whiteColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorManager.primaryColor,
        secondary: ColorManager.primaryColor, // Adjust as needed
      ),

    textTheme: TextTheme(
      headlineLarge: GoogleFonts.leagueSpartan(
        fontSize: 48,
        fontWeight: FontWeight.w100,
        height: 44.16 / 48,
        color: ColorManager.primaryColor,


      ),

      headlineMedium: GoogleFonts.leagueSpartan(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: ColorManager.primaryColor,
      ),

      bodySmall: GoogleFonts.leagueSpartan(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorManager.textBlackColor,


      ),

      displaySmall: GoogleFonts.leagueSpartan(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorManager.textBlackColor,


      ),

      labelSmall: GoogleFonts.leagueSpartan(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 11.04 / 12,
        color: ColorManager.primaryColor,


      ),

    )
  );



}