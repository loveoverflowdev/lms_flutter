import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lms_customer_app/ui/config/app_bar/web/web_app_bar.dart';
import 'package:lms_domain/domain/use_cases/customer/auth/customer_signup_use_case.dart';

import '../../../view_models/auth/signup/signup_cubit.dart';
import 'signup_view.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WebAppBar(),
            const SizedBox(height: 24),
            BlocProvider(
              create: (context) => SignupCubit(
                customerSignupUseCase:
                    GetIt.instance.get<CustomerSignupUseCase>(),
              ),
              child: const SignupView(),
            ),
          ],
        ),
      ),
    );
  }
}
