import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../view_models/login/login_cubit.dart';
import '../../../../../view_models/login/login_state.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.isAuthoried != current.isAuthoried,
      builder: (context, state) {
        final isAuthoried = state.isAuthoried;
        return Visibility(
          visible: isAuthoried,
          child: IconButton(
            icon: const Icon(Icons.shopping_cart_rounded),
            onPressed: () => {},
          ),
        );
      },
    );
  }
}