import 'package:flutter/material.dart';
import 'package:lms_customer_app/ui/config/app_bar/web/custom/profile_button.dart';

import '../../../../config/assets/app_assets.dart';
import '../../../../config/texts/localized_texts.dart';
import '../../../../config/theme/colors/app_colors.dart';
import 'custom/auth_button_row.dart';
import 'custom/cart_icon_button.dart';
import 'custom/app_bar_search_field.dart';

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
          Image.asset(
            AppAssets.logo,
            height: 40,
            width: 40,
          ),
          const Text(
            LocalizedTexts.cskh,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(width: 12),
          const Expanded(child: AppBarSearchField()),
          const SizedBox(width: 12),
          const CartIconButton(),
          const SizedBox(width: 12),
          const AuthButtonRow(),
          const SizedBox(width: 12),
          const ProfileButton(),
        ],
      ),
    );
  }
}
