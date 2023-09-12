import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lms_flutter/presentation/config/texts/localized_texts.dart';

import '../../../../../config/assets/app_assets.dart';
import '../../../../../config/theme/colors/app_colors.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppAssets.course,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(height: 4),
        Flexible(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return const AutoSizeText(
                LocalizedTexts.responsivenessInTheFlutterPlatforms,
                maxLines: 3,
                presetFontSizes: [16, 14, 12],
                overflowReplacement: Text(
                  LocalizedTexts.responsiveness,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.cultured,
                    fontSize: 16,
                    height: 2,
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: AppColors.cultured,
                ),
              );
            },
          ),
        ),
        const Text(
          LocalizedTexts.danielCiolfiAndFelipeSales,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: AppColors.grayX11,
          ),
        ),
        const Text(
          LocalizedTexts.price22dot90,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 12,
            color: AppColors.cultured,
          ),
        ),
      ],
    );
  }
}
