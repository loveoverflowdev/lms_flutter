import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/responsive/breakpoints.dart';
import '../cubits/top_course_list_cubit/top_course_list_cubit.dart';
import 'home_view.dart';
import '../../config/app_bar/mobile_app_bar.dart';
import '../../config/app_bar/web_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
