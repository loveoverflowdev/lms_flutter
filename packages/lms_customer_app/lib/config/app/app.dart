import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:lms_domain/domain/use_cases/customer_use_cases.dart';

import '../../view_models/login/login_cubit.dart';
import '../texts/localized_texts.dart';
import '../theme/app_theme.dart';
import 'app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        loginUseCase: GetIt.instance.get<CustomerLoginUseCase>(),
      ),
      child: MaterialApp.router(
        title: LocalizedTexts.app,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.primary,
        routerConfig: AppRouter.router,
        builder: EasyLoading.init(),
      ),
    );
  }
}
