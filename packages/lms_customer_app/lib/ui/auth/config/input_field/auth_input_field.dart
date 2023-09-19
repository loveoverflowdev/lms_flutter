import 'package:flutter/material.dart';

import '../../../../config/theme/colors/app_colors.dart';

class AuthInputField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final void Function(String)? onChanged;

  const AuthInputField({
    super.key,
    this.onChanged,
    this.obscureText = false,
    required this.labelText,
  });

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  late bool _displayInputText;

  @override
  void initState() {
    super.initState();
    _displayInputText = !widget.obscureText;
  }

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
          onChanged: widget.onChanged,
          obscureText: !_displayInputText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelText: widget.labelText,
            border: InputBorder.none,
            labelStyle: const TextStyle(
              color: AppColors.black87,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _displayInputText =
                            !widget.obscureText || !_displayInputText;
                      });
                    },
                    icon: Icon(
                      _displayInputText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.black87,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
