import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final void Function() onPressed;

  final String title;
  const CommonElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}
