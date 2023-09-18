import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_customer_app/config/app/app_router.dart';
import 'package:lms_customer_app/config/texts/localized_texts.dart';
import 'package:lms_domain/domain/entities/customer_entities.dart';
import 'package:text_avatar/text_avatar.dart';

import '../../config/theme/colors/app_colors.dart';
import '../../view_models/auth/auth_cubit.dart';
import '../../view_models/auth/auth_state.dart';

extension ProfileViewActions on ProfileView {
  void logOut(BuildContext context) {
    context.read<AuthCubit>().logOut();
    context.go(AppRouter.home);
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final Customer? customer = state.loginResult?.customer;
        if (customer == null) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IntrinsicWidth(
            child: Row(
              children: [
                const VerticalDivider(
                  width: 2,
                ),
                SizedBox(
                  width: 240,
                  child: Column(
                    children: [
                      TextAvatarWidget(
                        shape: Shape.circular,
                        size: 80,
                        text: customer.displayName,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        customer.displayName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () => logOut(context),
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
                          child: const Text(
                            LocalizedTexts.logOut,
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Column(
                    children: [
                      _CustomerFieldTile(
                        title: 'Tên đăng nhập',
                        value: customer.username,
                      ),
                      const SizedBox(height: 12),
                      _CustomerFieldTile(
                        title: 'Email',
                        value: customer.email,
                      ),
                      const SizedBox(height: 12),
                      _CustomerFieldTile(
                        title: 'Điện thoại',
                        value: customer.phoneNumber,
                      ),
                      const SizedBox(height: 12),
                      _CustomerFieldTile(
                        title: 'Mã CTV',
                        value: customer.affilicateCode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CustomerFieldTile extends StatelessWidget {
  final String title;
  final String value;

  const _CustomerFieldTile({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.black87,
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
