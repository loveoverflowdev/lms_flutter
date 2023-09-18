import 'package:flutter/material.dart';

import '../../../../../config/responsive/breakpoints.dart';
import '../../../../../config/texts/localized_texts.dart';
import '../../../../../config/theme/colors/app_colors.dart';
import 'advantages_section_horizontal.dart';
import 'advantages_section_vertical.dart';

class AdvantagesSection extends StatelessWidget {
  const AdvantagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoints.mobileBreakpoint) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.graniteGray),
              ),
            ),
            child: const Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 16,
              spacing: 16,
              children: [
                AdvantagesSectionHorizontal(
                  iconData: Icons.connect_without_contact,
                  title: LocalizedTexts.moreThan100kDevelopers,
                  subtitle: LocalizedTexts.awesomeExclamation,
                ),
                AdvantagesSectionHorizontal(
                  iconData: Icons.card_membership,
                  title: LocalizedTexts.certificateOfComplete,
                  subtitle: LocalizedTexts.sensationalExclamation,
                ),
                AdvantagesSectionHorizontal(
                  iconData: Icons.verified,
                  title: LocalizedTexts.sensationalExclamation,
                  subtitle: LocalizedTexts.anywhereExclamation,
                ),
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.graniteGray),
            ),
          ),
          child: const Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 16,
            spacing: 32,
            children: [
              AdvantagesSectionVertical(
                iconData: Icons.connect_without_contact,
                title: LocalizedTexts.moreThan100kDevelopers,
                subtitle: LocalizedTexts.awesomeExclamation,
              ),
              AdvantagesSectionVertical(
                iconData: Icons.card_membership,
                title: LocalizedTexts.certificateOfComplete,
                subtitle: LocalizedTexts.sensationalExclamation,
              ),
              AdvantagesSectionVertical(
                iconData: Icons.verified,
                title: LocalizedTexts.sensationalExclamation,
                subtitle: LocalizedTexts.anywhereExclamation,
              ),
            ],
          ),
        );
      },
    );
  }
}
