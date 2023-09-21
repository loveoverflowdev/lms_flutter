import 'package:flutter/material.dart';
import 'package:lms_customer_app/config/texts/localized_texts.dart';
import 'package:lms_customer_app/ui/config/buttons/common_elevated_button.dart';

class CheckoutContainer extends StatelessWidget {
  final int coins;
  const CheckoutContainer({
    super.key,
    this.coins = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$coins Coins",
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: CommonElevatedButton(
              title: LocalizedTexts.checkout,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
