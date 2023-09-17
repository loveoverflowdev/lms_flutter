import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/app/app_router.dart';
import '../../../config/assets/app_assets.dart';
import '../../../config/texts/localized_texts.dart';
import '../../../config/theme/colors/app_colors.dart';
import 'web_app_bar_responsive_content.dart';

extension WebAppBarActions on WebAppBar {
  void routeToLoginPage(BuildContext context) {
    if (kIsWeb) {
      context.go(AppRouter.login);
    } else {
      context.push(AppRouter.login);
    }
  }

  void routeToSignupPage(BuildContext context) {
    if (kIsWeb) {
      context.go(AppRouter.signup);
    } else {
      context.push(AppRouter.signup);
    }
  }
}

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.cultured,
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
            onPressed: () => routeToLoginPage(context),
          ),
          const SizedBox(width: 16),
          Builder(builder: (context) {
            final textLength =
                max(LocalizedTexts.login.length, LocalizedTexts.login.length);
            return Row(
              children: [
                SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () => routeToLoginPage(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.black87,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      padCenter(LocalizedTexts.login, textLength),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.vampireBlack,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => routeToSignupPage(context),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.black87,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.black87,
                    ),
                    child: Text(
                      padCenter(LocalizedTexts.signUp, textLength),
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  String padCenter(String input, int width, [String paddingChar = ' ']) {
    final padLeftLength = (width - input.length) ~/ 2;
    return input.padLeft(width - padLeftLength).padRight(width - padLeftLength);
  }
}
