import 'package:flutter/material.dart';

import '../../../../../config/texts/localized_texts.dart';
import '../../../../../config/theme/colors/app_colors.dart';

class AppBarSearchField extends StatelessWidget {
  const AppBarSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.cultured,
                  border: Border.all(
                    color: AppColors.sonicSilver,
                  ),
                  borderRadius: BorderRadius.circular(48 / 2),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: AppColors.graniteGray,
                      ),
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: LocalizedTexts.searchForAnythingSpaced,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // if (constraints.maxWidth >= Breakpoints.showOnlyLearn) ...[
            //   const SizedBox(width: 24),
            //   TextButton(
            //     onPressed: () {},
            //     child: const Text(
            //       LocalizedTexts.learn,
            //       style: TextStyle(
            //         fontWeight: FontWeight.w600,
            //         color: AppColors.cultured,
            //         letterSpacing: 1.1,
            //       ),
            //     ),
            //   ),
            // ],
          ],
        );
      },
    );
  }
}
