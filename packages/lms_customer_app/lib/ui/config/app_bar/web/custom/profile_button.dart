import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_customer_app/view_models/login/login_cubit.dart';
import 'package:lms_customer_app/view_models/login/login_state.dart';
import 'package:text_avatar/text_avatar.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.isAuthoried != current.isAuthoried,
      builder: (context, state) {
        final isAuthorized = state.isAuthoried;
        final customer = state.loginResult?.customer;
        return Visibility(
          visible: isAuthorized,
          child: TextAvatarWidget(
            shape: Shape.circular,
            size: 48,
            text: customer?.displayName,
          ),
        );
      },
    );
  }
}
