import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_customer_app/config/app/app_router.dart';

import '../../../../../view_models/auth/auth_cubit.dart';
import '../../../../../view_models/auth/auth_state.dart';

extension CartIconButtonActions on CartIconButton {
  void routeToCustomerCartPage(BuildContext context) {
    context.go(AppRouter.customerCart);
  }
}

class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.isAuthoried != current.isAuthoried,
      builder: (context, state) {
        final isAuthoried = state.isAuthoried;
        return Visibility(
          visible: isAuthoried,
          child: IconButton(
            icon: const Icon(Icons.shopping_cart_rounded),
            onPressed: () => routeToCustomerCartPage(context),
          ),
        );
      },
    );
  }
}
