import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import '../../view_models/auth/auth_cubit.dart';
import '../../view_models/cart/courses_in_cart/courses_in_cart_cubit.dart';
import '../texts/localized_texts.dart';
import '../theme/app_theme.dart';
import 'app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
            loginUseCase: GetIt.instance.get(),
          ),
        ),
        BlocProvider(
          create: (_) => CoursesInCartCubit(
            addCourseToCartUseCase: GetIt.instance.get(),
            getCourseListInCartUseCase: GetIt.instance.get(),
            removeCourseFromCartUseCase: GetIt.instance.get(),
          ),
        ),
      ],
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
