import 'package:flutter/material.dart';

import '../../../../config/texts/localized_texts.dart';
import '../../../../config/theme/colors/app_colors.dart';

class SectionSearchField extends StatelessWidget {
  const SectionSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.blue,
      style: const TextStyle(color: AppColors.vampireBlack),
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.vampireBlack,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.vampireBlack),
        ),
        hintStyle: const TextStyle(color: AppColors.vampireBlack),
        hintText: LocalizedTexts.typeSomeSearchHere,
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          color: AppColors.vampireBlack,
          onPressed: () {},
        ),
      ),
    );
  }
}
