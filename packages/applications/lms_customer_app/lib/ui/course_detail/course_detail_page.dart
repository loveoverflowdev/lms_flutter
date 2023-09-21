// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lms_customer_app/ui/config/app_bar/web/web_app_bar.dart';

import '../../view_models/courses/course_detail_cubit/course_detail_cubit.dart';
import 'course_detail_view.dart';

class CourseDetailPageParams {
  final String? courseId;
  CourseDetailPageParams({
    required this.courseId,
  });
}

class CourseDetailPage extends StatelessWidget {
  final CourseDetailPageParams params;
  const CourseDetailPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WebAppBar(),
          const SizedBox(height: 24),
          BlocProvider(
            create: (context) => CourseDetailCubit(
              getCourseDetailUseCase: GetIt.instance(),
            ),
            child: CourseDetailView(
              courseId: params.courseId,
            ),
          ),
        ],
      ),
    );
  }
}
