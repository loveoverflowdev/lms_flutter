import 'package:flutter/material.dart';

import '../config/input_field/auth_input_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = 200.0;
            double formWidth = constraints.maxWidth < maxWidth
                ? constraints.maxWidth
                : maxWidth;
            return SizedBox(
              width: formWidth,
              child: const Column(
                children: [
                  AuthInputField(
                    labelText: 'Email',
                  ),
                  AuthInputField(
                    labelText: 'Password',
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
