import 'package:flutter/material.dart';
import 'package:product_list/routes/navigation_helper.dart';
import 'package:product_list/core/utils/theme_helper.dart';




class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBackButton;
  final VoidCallback? onBackButtonPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.hasBackButton = false,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: context.textTheme.titleLarge?.copyWith(
          letterSpacing: 5,
        ),
        overflow: TextOverflow.fade,
      ),
      centerTitle: true,
      leading: hasBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBackButtonPressed ?? () => context.pop(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
