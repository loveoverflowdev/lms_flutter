import 'package:flutter/material.dart';

import '../config/app_bar/web/web_app_bar.dart';
import 'profile_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(),
            SizedBox(height: 24),
            ProfileView(),
          ],
        ),
      ),
    );
  }
}
