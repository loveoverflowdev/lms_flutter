import 'package:flutter/material.dart';
import 'package:lms_customer_app/config/theme/colors/app_colors.dart';

class CommonElevatedButton extends StatelessWidget {
  final bool outlined;
  final void Function() onPressed;

  final String title;
  const CommonElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme.primary;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: outlined
              ? BorderSide(width: 1, color: themeColor)
              : BorderSide.none,
        ),
        backgroundColor: outlined ? AppColors.white : null,
        foregroundColor: !outlined ? AppColors.white : themeColor,
        elevation: 0,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
