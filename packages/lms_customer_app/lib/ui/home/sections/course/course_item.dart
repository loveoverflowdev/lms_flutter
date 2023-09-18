import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lms_domain/domain/entities/products/course.dart';

import '../../../../../config/theme/colors/app_colors.dart';

class CourseItem extends StatelessWidget {
  final Course course;

  const CourseItem({
    required this.course,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _buildCourseCoverImage(),
        ),
        const SizedBox(height: 4),
        LayoutBuilder(
          builder: (context, constraints) {
            return AutoSizeText(
              course.title,
              maxLines: 2,
              presetFontSizes: const [16, 14, 12],
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: AppColors.vampireBlack,
              ),
            );
          },
        ),
        Text(
          course.description,
          maxLines: 2,
          style: const TextStyle(
            overflow: TextOverflow.clip,
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: AppColors.grayX11,
          ),
        ),
        Text(
          "${course.primaryCoins} Coins",
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 12,
            color: AppColors.vampireBlack,
          ),
        ),
      ],
    );
  }

  Image _buildCourseCoverImage() {
    return Image.network(
      course.coverImage,
      fit: BoxFit.cover,
    );
  }
}
