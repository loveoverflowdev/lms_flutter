import 'package:flutter/material.dart';
import 'package:lms_flutter/presentation/config/texts/localized_texts.dart';

import '../../../../config/responsive/breakpoints.dart';
import '../../../../config/theme/colors/app_colors.dart';

class WebAppBarResponsiveContent extends StatelessWidget {
  const WebAppBarResponsiveContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.cultured,
                    border: Border.all(
                      color: AppColors.sonicSilver,
                    ),
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
              if (constraints.maxWidth >= Breakpoints.showOnlyLearn) ...[
                const SizedBox(width: 24),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    LocalizedTexts.learn,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.cultured,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
              if (constraints.maxWidth >= Breakpoints.showFlutterButton) ...[
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    LocalizedTexts.flutter,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.cultured,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
