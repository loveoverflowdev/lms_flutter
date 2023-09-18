import 'package:flutter/material.dart';
import '../../config/app_bar/web/web_app_bar.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(),
            SizedBox(height: 24),
            LoginView(),
          ],
        ),
      ),
    );
  }
}
