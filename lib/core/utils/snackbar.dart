import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../themes/app_colors.dart';

extension SnackBarExtension on BuildContext {
  void showCustomSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style:  TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: Colors.red,
        ),
      ),
      backgroundColor: AppColors.white, // Customize the background color
      behavior: SnackBarBehavior.floating, // Makes it float above the UI
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      duration: const Duration(seconds: 2),
    );

    // Display the SnackBar
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
