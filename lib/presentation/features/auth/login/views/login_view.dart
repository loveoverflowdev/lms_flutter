import 'package:flutter/material.dart';
import 'package:lms_flutter/presentation/config/texts/localized_texts.dart';
import 'package:lms_flutter/presentation/features/config/app_bar/web_app_bar.dart';

import '../../config/button/auth_button.dart';
import '../../config/input_field/auth_input_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WebAppBar(),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = 360.0;
              double formWidth = constraints.maxWidth < maxWidth
                  ? constraints.maxWidth
                  : maxWidth;
              return Center(
                child: SizedBox(
                  width: formWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LocalizedTexts.loginToCSKH,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      AuthInputField(
                        labelText: 'Email or Username',
                      ),
                      SizedBox(height: 8),
                      AuthInputField(
                        labelText: 'Password',
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 48,
                        child: AuthButton(
                          onPressed: () {},
                          title: LocalizedTexts.login,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
