import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_domain/domain/entities/customer_entities.dart';

import '../../../../config/app/app_router.dart';
import '../../../../config/status/loading_status.dart';
import '../../../../config/texts/localized_texts.dart';
import '../../../../config/widgets/loading_widget.dart';
import '../../../config/app_bar/web_app_bar.dart';
import '../../../home/views/home_page.dart';
import '../../config/button/auth_button.dart';
import '../../config/input_field/auth_input_field.dart';
import '../cubits/login_cubit.dart';
import '../cubits/login_state.dart';

extension LoginViewActions on LoginView {
  void onLoginSuccess(BuildContext context, final Customer customer) {
    context.go(
      AppRouter.home,
      extra: AuthorizedHomeParams(customer: customer),
    );
  }

  void onLoginFailure(BuildContext context, String message) {
    EasyLoading.showError(message);
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewViewState();
}

class _LoginViewViewState extends State<LoginView> {
  late final LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = context.read<LoginCubit>();
  }

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
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LocalizedTexts.loginToCSKH,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AuthInputField(
                        labelText: 'Email or Username',
                        onChanged: (value) {
                          _loginCubit.changeUsernameOrEmail(value);
                        },
                      ),
                      const SizedBox(height: 8),
                      AuthInputField(
                        labelText: 'Password',
                        onChanged: (value) {
                          _loginCubit.changePassword(value);
                        },
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 48,
                        child: BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            switch (state.loadingStatus) {
                              case LoadingStatus.error:
                                widget.onLoginFailure(context, state.message);
                                break;
                              case LoadingStatus.success:
                                if (state.customer == null) {
                                  widget.onLoginFailure(context,
                                      'Lỗi khách hàng trống sau khi đăng nhập');
                                } else {
                                  widget.onLoginSuccess(
                                      context, state.customer!);
                                }
                                break;
                              default:
                                break;
                            }
                          },
                          buildWhen: (previous, current) {
                            return (previous.loadingStatus ==
                                    LoadingStatus.loading) !=
                                (current.loadingStatus ==
                                    LoadingStatus.loading);
                          },
                          builder: (context, state) {
                            return Visibility(
                              replacement: const LoadingWidget(),
                              visible:
                                  state.loadingStatus != LoadingStatus.error,
                              child: AuthButton(
                                onPressed: () {
                                  _loginCubit.logIn();
                                },
                                title: LocalizedTexts.login,
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
          ),
        ],
      ),
    );
  }
}
