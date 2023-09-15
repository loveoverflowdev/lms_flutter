import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lms_flutter/data/models/products/data_course.dart';
import 'package:lms_flutter/presentation/config/texts/localized_texts.dart';

import '../../../../../config/theme/colors/app_colors.dart';

class CourseItem extends StatelessWidget {
  final DataCourse course;

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
              course.title ?? '',
              maxLines: 2,
              presetFontSizes: const [16, 14, 12],
              overflowReplacement: const Text(
                LocalizedTexts.responsiveness,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.cultured,
                  fontSize: 16,
                  height: 2,
                ),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: AppColors.cultured,
              ),
            );
          },
        ),
        Text(
          course.description ?? '',
          maxLines: 2,
          style: const TextStyle(
            overflow: TextOverflow.clip,
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: AppColors.grayX11,
          ),
        ),
        if (course.primaryCoins != null)
          Text(
            "${course.primaryCoins} Coins",
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 12,
              color: AppColors.cultured,
            ),
          ),
      ],
    );
  }

  Image _buildCourseCoverImage() {
    return Image.network(
      course.coverImage ?? '',
      fit: BoxFit.cover,
    );
  }
}
