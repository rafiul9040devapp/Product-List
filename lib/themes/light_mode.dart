import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade900,
  ),
  scaffoldBackgroundColor: Colors.grey.shade300,
  brightness: Brightness.light,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 36.sp,
          height: 1.5,
          fontWeight: FontWeight.w600),
    ),
    displayMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 26.sp,
          fontWeight: FontWeight.bold),
    ),
    displaySmall: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold),
    ),
    titleLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600),
    ),
    titleMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600),
    ),
    titleSmall: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500),
    ),
    bodyLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
    bodyMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal),
    ),
    bodySmall: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.grey,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal),
    ),
    labelLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 12.spMax,
          fontWeight: FontWeight.normal),
    ),
    labelMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 10.spMax,
          fontWeight: FontWeight.normal),
    ),
    labelSmall: GoogleFonts.roboto(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 8.spMax,
          fontWeight: FontWeight.normal),
    ),
  ),
);
