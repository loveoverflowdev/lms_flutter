import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_flutter/presentation/config/status/loading_status.dart';

import '../../../../../config/responsive/breakpoints.dart';
import '../../../../../config/widgets/loading_widget.dart';
import '../../../cubits/top_course_list_cubit/top_course_list_cubit.dart';
import '../../../cubits/top_course_list_cubit/top_course_list_state.dart';
import 'course_item.dart';

class CourseSection extends StatefulWidget {
  const CourseSection({super.key});

  @override
  State<CourseSection> createState() => _CourseSectionState();
}

class _CourseSectionState extends State<CourseSection> {
  @override
  void initState() {
    super.initState();
    context.read<TopCourseListCubit>().loadCourseList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return BlocBuilder<TopCourseListCubit, TopCourseListState>(
          builder: (context, state) {
            return Visibility(
              replacement: const LoadingWidget(),
              visible: state.loadingStatus.isFinished,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 280,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: maxWidth >= Breakpoints.tabletMedium ? 0 : 16,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.courseList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final course = state.courseList[index];
                  return CourseItem(course: course);
                },
              ),
            );
          },
        );
      },
    );
  }
}
