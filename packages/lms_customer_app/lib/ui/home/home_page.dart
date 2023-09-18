// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_domain/domain/entities/customer_entities.dart';

import '../../../config/responsive/breakpoints.dart';
import '../../../view_models/courses/top_course_list_cubit/top_course_list_cubit.dart';
import '../config/app_bar/mobile/mobile_app_bar.dart';
import '../config/app_bar/web/web_app_bar.dart';
import 'home_view.dart';

class AuthorizedHomeParams {
  final Customer customer;
  const AuthorizedHomeParams({
    required this.customer,
  });
}

class HomePage extends StatelessWidget {
  final AuthorizedHomeParams? customerAuthorizedHomeParams;
  const HomePage({
    super.key,
    this.customerAuthorizedHomeParams,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxWidth < Breakpoints.mobileBreakpoint
              ? const PreferredSize(
                  preferredSize: Size(double.infinity, 56),
                  child: MobileAppBar(),
                )
              : const PreferredSize(
                  preferredSize: Size(double.infinity, 80),
                  child: WebAppBar(),
                ),
          drawer: constraints.maxWidth < Breakpoints.mobileBreakpoint
              ? const Drawer()
              : null,
          body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1200,
              ),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => TopCourseListCubit(),
                  ),
                ],
                child: const HomeView(),
              ),
            ),
          ),
        );
      },
    );
  }
}
