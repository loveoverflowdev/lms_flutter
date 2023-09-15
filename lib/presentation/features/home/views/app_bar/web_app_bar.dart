import 'package:flutter/material.dart';

import '../../../../config/assets/app_assets.dart';
import '../../../../config/texts/localized_texts.dart';
import '../../../../config/theme/colors/app_colors.dart';
import 'web_app_bar_responsive_content.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black87,
      toolbarHeight: 80,
      title: Row(
        children: [
          Image.asset(
            AppAssets.logo,
            height: 40,
            width: 40,
          ),
          const Text(
            LocalizedTexts.cskh,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(width: 24),
          const WebAppBarResponsiveContent(),
          const SizedBox(width: 24),
          IconButton(
            icon: const Icon(Icons.shopping_cart_rounded),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 38,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.resolveWith<BorderSide>(
                  (states) {
                    return const BorderSide(
                      color: AppColors.white,
                      width: 1.5,
                    );
                  },
                ),
              ),
              child: const Text(
                LocalizedTexts.loginSpaced,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.black87,
                backgroundColor: AppColors.white,
              ),
              child: const Text(
                LocalizedTexts.signUpSpaced,
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
