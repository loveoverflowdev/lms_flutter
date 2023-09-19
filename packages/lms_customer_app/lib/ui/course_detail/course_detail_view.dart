import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_customer_app/config/status/loading_status.dart';
import 'package:lms_customer_app/config/widgets/loading_widget.dart';
import 'package:lms_customer_app/ui/config/buttons/common_elevated_button.dart';
import 'package:lms_customer_app/view_models/courses/course_detail_cubit/course_detail_cubit.dart';
import 'package:lms_domain/domain/entities/customer_entities.dart';

import '../../config/theme/colors/app_colors.dart';
import '../../view_models/courses/course_detail_cubit/course_detail_state.dart';

class CourseDetailView extends StatefulWidget {
  final String? courseId;
  const CourseDetailView({
    super.key,
    required this.courseId,
  });

  @override
  State<CourseDetailView> createState() => _CourseDetailViewState();
}

class _CourseDetailViewState extends State<CourseDetailView> {
  @override
  void initState() {
    super.initState();
    if (widget.courseId != null) {
      context.read<CourseDetailCubit>().loadCourse(widget.courseId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailCubit, CourseDetailState>(
      builder: (context, state) {
        return Visibility(
          visible: state.loadingStatus != LoadingStatus.loading,
          replacement: const LoadingWidget(),
          child: Builder(builder: (context) {
            final course = state.course;
            if (course == null) {
              return const Placeholder();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Flexible(
                    child: _CourseTitle(
                      course: course,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Flexible(
                    child: SizedBox(
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 48,
                            child: CommonElevatedButton(
                              title: 'Thêm vào giỏ hàng',
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 48,
                            child: CommonElevatedButton(
                              title: 'Mua ngay',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}

class _CourseTitle extends StatelessWidget {
  final Course course;

  const _CourseTitle({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildCourseCoverImage(),
          ),
          const SizedBox(height: 16),
          AutoSizeText(
            course.title,
            maxLines: 10,
            presetFontSizes: const [16, 14, 12],
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: AppColors.vampireBlack,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            course.description,
            maxLines: 10,
            style: const TextStyle(
              overflow: TextOverflow.clip,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.grayX11,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${course.primaryCoins} Coins",
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
              color: AppColors.vampireBlack,
            ),
          ),
        ],
      ),
    );
  }

  Image _buildCourseCoverImage() {
    return Image.network(
      course.coverImage,
      fit: BoxFit.cover,
    );
  }
}
