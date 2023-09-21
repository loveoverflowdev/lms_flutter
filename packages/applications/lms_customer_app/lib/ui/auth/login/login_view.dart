import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../config/app/app_router.dart';
import '../../../config/status/loading_status.dart';
import '../../../config/texts/localized_texts.dart';
import '../../../config/widgets/loading_widget.dart';
import '../../../view_models/auth/auth_cubit.dart';
import '../../../view_models/auth/auth_state.dart';
import '../../config/buttons/common_elevated_button.dart';
import '../config/input_field/auth_input_field.dart';

extension LoginViewActions on LoginView {
  void onLoginSuccess(BuildContext context) {
    EasyLoading.showInfo(LocalizedTexts.logInSuccess);
    context.go(
      AppRouter.home,
    );
  }

  void onLoginFailure(BuildContext context, String message) {
    EasyLoading.showError(message);
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                    LocalizedTexts.logInToCSKH,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AuthInputField(
                  labelText: 'Tên đăng nhập hoặc Email',
                  onChanged: (value) {
                    context.read<AuthCubit>().changeUsernameOrEmail(value);
                  },
                ),
                const SizedBox(height: 8),
                AuthInputField(
                  obscureText: true,
                  labelText: 'Mật khẩu',
                  onChanged: (value) {
                    context.read<AuthCubit>().changePassword(value);
                  },
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      switch (state.loadingStatus) {
                        case LoadingStatus.error:
                          onLoginFailure(context, state.message);
                          break;
                        case LoadingStatus.success:
                          onLoginSuccess(context);
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
                            context.read<AuthCubit>().logIn();
                          },
                          title: LocalizedTexts.logIn,
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
