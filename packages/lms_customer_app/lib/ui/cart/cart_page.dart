import 'package:flutter/material.dart';
import 'package:lms_customer_app/ui/cart/cart_view.dart';

import '../config/app_bar/web/web_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        WebAppBar(),
        SizedBox(height: 24),
        CartView(),
      ],
    );
  }
}
