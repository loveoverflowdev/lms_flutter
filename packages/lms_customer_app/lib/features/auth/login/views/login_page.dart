import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lms_domain/domain/use_cases/customer_use_cases.dart';

import '../cubits/login_cubit.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(
          loginUseCase: GetIt.instance.get<CustomerLoginUseCase>(),
        ),
        child: const LoginView(),
      ),
    );
  }
}
