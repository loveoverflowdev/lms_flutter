import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_customer_app/config/app/app_router.dart';

import '../../../../config/assets/app_assets.dart';
import '../../../../config/texts/localized_texts.dart';
import '../../../../config/theme/colors/app_colors.dart';
import 'custom/auth_button_row.dart';
import 'custom/cart_icon_button.dart';
import 'custom/app_bar_search_field.dart';
import 'custom/profile_button.dart';

extension WebAppBarActions on WebAppBar {
  void routeToHomePage(BuildContext context) {
    context.go(AppRouter.home);
  }
}

class WebAppBar extends StatelessWidget {
  const WebAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.cultured,
      toolbarHeight: 80,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => routeToHomePage(context),
            child: Row(
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
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(child: AppBarSearchField()),
          const SizedBox(width: 12),
          const CartIconButton(),
          const SizedBox(width: 12),
          const CommonElevatedButtonRow(),
          const SizedBox(width: 12),
          const ProfileButton(),
        ],
      ),
    );
  }
}
