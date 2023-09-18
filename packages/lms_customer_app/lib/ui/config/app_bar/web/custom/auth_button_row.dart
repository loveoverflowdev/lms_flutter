import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app/app_router.dart';
import '../../../../../config/texts/localized_texts.dart';
import '../../../../../config/theme/colors/app_colors.dart';
import '../../../../../view_models/login/login_cubit.dart';
import '../../../../../view_models/login/login_state.dart';

extension AuthButtonRowActions on AuthButtonRow {
  void routeToLoginPage(BuildContext context) {
    if (kIsWeb) {
      context.go(AppRouter.login);
    } else {
      context.push(AppRouter.login);
    }
  }

  void routeToSignupPage(BuildContext context) {
    if (kIsWeb) {
      context.go(AppRouter.signup);
    } else {
      context.push(AppRouter.signup);
    }
  }
}

class AuthButtonRow extends StatelessWidget {
  const AuthButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.isAuthoried != current.isAuthoried,
      builder: (context, state) {
        final isAuthoried = state.isAuthoried;
        return Visibility(
          visible: !isAuthoried,
          child: Builder(builder: (context) {
            final textLength =
                max(LocalizedTexts.login.length, LocalizedTexts.login.length);
            return Row(
              children: [
                SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () => routeToLoginPage(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.black87,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      padCenter(LocalizedTexts.login, textLength),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.vampireBlack,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => routeToSignupPage(context),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.black87,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.black87,
                    ),
                    child: Text(
                      padCenter(LocalizedTexts.signUp, textLength),
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }

  String padCenter(String input, int width, [String paddingChar = ' ']) {
    final padLeftLength = (width - input.length) ~/ 2;
    return input.padLeft(width - padLeftLength).padRight(width - padLeftLength);
  }
}
