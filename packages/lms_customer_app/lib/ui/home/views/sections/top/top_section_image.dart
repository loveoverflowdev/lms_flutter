import 'package:flutter/material.dart';

import '../../../../../config/assets/app_assets.dart';

class TopSectionImage extends StatelessWidget {
  const TopSectionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.app,
      fit: BoxFit.cover,
    );
  }
}
