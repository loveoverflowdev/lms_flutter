import 'package:flutter/material.dart';
import 'package:lms_flutter/presentation/config/texts/localized_texts.dart';

import '../../../../config/theme/colors/app_colors.dart';

class SectionSearchField extends StatelessWidget {
  const SectionSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.blue,
      style: const TextStyle(color: AppColors.lotion),
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lotion,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lotion),
        ),
        hintStyle: const TextStyle(color: AppColors.lotion),
        hintText: LocalizedTexts.typeSomeSearchHere,
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          color: AppColors.lotion,
          onPressed: () {},
        ),
      ),
    );
  }
}
