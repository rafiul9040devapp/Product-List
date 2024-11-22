import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:product_list/core/utils/theme_helper.dart';
import 'package:product_list/core/utils/ui_helper.dart';

import '../themes/app_colors.dart';
import '../themes/assets_path.dart';

class ErrorMessageDisplay extends StatelessWidget {
  final String message;

  const ErrorMessageDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Lottie.asset(
                AppAnimations.noInternetConnection,
                repeat: true,
                reverse: true,
                width: UIHelper.screenWidth * 0.8,
                height: UIHelper.screenHeight * 0.3,
              ),
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(color: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
