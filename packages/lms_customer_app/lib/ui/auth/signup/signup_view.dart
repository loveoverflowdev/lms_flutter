import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app/app_router.dart';
import '../../../config/status/loading_status.dart';
import '../../../config/texts/localized_texts.dart';
import '../../../config/widgets/loading_widget.dart';
import '../../../view_models/auth/signup/signup_cubit.dart';
import '../../../view_models/auth/signup/signup_state.dart';

import '../../config/buttons/common_elevated_button.dart';
import '../config/input_field/auth_input_field.dart';

extension SignupViewActions on SignupView {
  void onSignupSuccess(BuildContext context) {
    EasyLoading.showInfo(LocalizedTexts.signUpSuccess);
    context.go(AppRouter.login);
  }

  void onSignupFailure(BuildContext context, String message) {
    EasyLoading.showError(message);
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = 360.0;
        double formWidth =
            constraints.maxWidth < maxWidth ? constraints.maxWidth : maxWidth;
        return Center(
          child: SizedBox(
            width: formWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocalizedTexts.signUpToCSKH,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AuthInputField(
                  labelText: 'Tên đăng nhập',
                  onChanged: (value) {
                    context.read<SignupCubit>().changeUsername(value);
                  },
                ),
                const SizedBox(height: 8),
                AuthInputField(
                  labelText: 'Email',
                  onChanged: (value) {
                    context.read<SignupCubit>().changeEmail(value);
                  },
                ),
                const SizedBox(height: 8),
                AuthInputField(
                  labelText: 'Số điện thoại',
                  onChanged: (value) {
                    context.read<SignupCubit>().changePhoneNumber(value);
                  },
                ),
                const SizedBox(height: 8),
                AuthInputField(
                  obscureText: true,
                  labelText: 'Mật khẩu',
                  onChanged: (value) {
                    context.read<SignupCubit>().changePassword(value);
                  },
                ),
                const SizedBox(height: 8),
                AuthInputField(
                  obscureText: true,
                  labelText: 'Nhập lại Mật khẩu',
                  onChanged: (value) {
                    context.read<SignupCubit>().changeRetypedPassword(value);
                  },
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  child: BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                      switch (state.loadingStatus) {
                        case LoadingStatus.error:
                          onSignupFailure(context, state.message);
                          break;
                        case LoadingStatus.success:
                          onSignupSuccess(context);
                          break;
                        default:
                          break;
                      }
                    },
                    buildWhen: (previous, current) {
                      return (previous.loadingStatus ==
                              LoadingStatus.loading) !=
                          (current.loadingStatus == LoadingStatus.loading);
                    },
                    builder: (context, state) {
                      return Visibility(
                        replacement: const LoadingWidget(),
                        visible: state.loadingStatus != LoadingStatus.loading,
                        child: CommonElevatedButton(
                          onPressed: () {
                            context.read<SignupCubit>().signUp();
                          },
                          title: LocalizedTexts.signUp,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
