import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_customer_app/config/app/app_router.dart';
import 'package:text_avatar/text_avatar.dart';

import '../../../../../view_models/auth/auth_cubit.dart';
import '../../../../../view_models/auth/auth_state.dart';

extension ProfileButtonAction on ProfileButton {
  void routeToProfilePage(BuildContext context) {
    context.go(AppRouter.profile);
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.isAuthoried != current.isAuthoried,
      builder: (context, state) {
        final isAuthorized = state.isAuthoried;
        final customer = state.loginResult?.customer;
        final displayName = customer?.displayName;
        final primaryCoins = customer?.primaryCoins ?? 0;
        return Visibility(
          visible: isAuthorized,
          child: GestureDetector(
            onTap: () => routeToProfilePage(context),
            child: Row(
              children: [
                TextAvatarWidget(
                  shape: Shape.circular,
                  size: 48,
                  text: displayName,
                ),
                const SizedBox(width: 8),
                Text(
                  "$primaryCoins Coins",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
