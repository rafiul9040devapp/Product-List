import 'package:flutter/material.dart';

import '../core/utils/ui_helper.dart';
import '../themes/app_colors.dart';


class CustomButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;
  Future<void> _handlePress() async {
    if (_isPressed) return;
    setState(() => _isPressed = true);
    try {
       widget.onTap();
    } finally {
      setState(() => _isPressed = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: _isPressed ? null : _handlePress,
      child: Container(
        padding: UIHelper.symmetricMargin(vertical: 16,horizontal: 8),
        decoration: BoxDecoration(
          color: colorTheme.tertiary, // Button color
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Center(
          child: Text(
            widget.text,
            style: textTheme.titleMedium?.copyWith(color: AppColors.black),
          ),
        ),
      ),
    );
  }
}
