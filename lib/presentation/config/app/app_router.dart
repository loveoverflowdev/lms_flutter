import 'package:go_router/go_router.dart';
import 'package:lms_flutter/presentation/features/auth/login/views/login_page.dart';
import 'package:lms_flutter/presentation/features/auth/signup/views/signup_page.dart';

import '../page_transition/page_transition.dart';
import '../../features/home/views/home_page.dart';

class AppRouter {
  static const home = '/home';
  static const login = '/login';
  static const signup = '/signup';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        pageBuilder: (context, state) {
          return PageTransition.fade(
            page: const HomePage(),
          );
        },
      ),
      GoRoute(
        path: login,
        pageBuilder: (context, state) {
          return PageTransition.fade(
            page: const LoginPage(),
          );
        },
      ),
      GoRoute(
        path: signup,
        pageBuilder: (context, state) {
          return PageTransition.fade(
            page: const SignupPage(),
          );
        },
      ),
    ],
  );
}
