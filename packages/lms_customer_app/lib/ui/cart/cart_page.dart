import 'package:flutter/material.dart';

import '../config/app_bar/web/web_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          WebAppBar(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
