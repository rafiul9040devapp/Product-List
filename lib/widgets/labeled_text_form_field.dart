import 'package:flutter/material.dart';

class LabeledTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final List<dynamic>? inputFormatters;
  final TextInputType? inputType;

  const LabeledTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    this.validator,
    this.inputFormatters,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: colorTheme.onSurface,
          ),
        ),
        const SizedBox(height: 8), // Spacing between label and field
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: inputType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorTheme.tertiary,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorTheme.primary,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: colorTheme.primary.withOpacity(0.6),
            ),
            filled: true,
            fillColor: colorTheme.secondary,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorTheme.error,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorTheme.error,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
