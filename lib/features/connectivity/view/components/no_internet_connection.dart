import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:product_list/core/utils/theme_helper.dart';
import 'package:product_list/core/utils/ui_helper.dart';

import '../../../../generated/l10n.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/assets_path.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

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
                width: UIHelper.screenWidth * .8,
                height: UIHelper.screenHeight * .35,
              ),
            ),
            Text(
              S.current.not_internet_connection,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(color: AppColors.red),
            ),
            UIHelper.verticalSpaceMedium(),
          ],
        ),
      ),
    );
  }
}
