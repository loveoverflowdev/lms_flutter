import 'package:flutter/material.dart';

import '../../../../config/theme/colors/app_colors.dart';

class AuthInputField extends StatelessWidget {
  final String labelText;
  final void Function(String)? onChanged;

  const AuthInputField({
    super.key,
    this.onChanged,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.black87,
          width: 0.5,
        ),
      ),
      child: Center(
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelText: labelText,
            border: InputBorder.none,
            labelStyle: const TextStyle(
              color: AppColors.black87,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}