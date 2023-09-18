import 'package:go_router/go_router.dart';
import 'package:lms_customer_app/ui/profile/profile_page.dart';

import '../../ui/auth/login/login_page.dart';
import '../../ui/auth/signup/signup_page.dart';
import '../../ui/home/home_page.dart';
import '../page_transition/page_transition.dart';

class AppRouter {
  static const home = '/home';
  static const login = '/login';
  static const signup = '/signup';
  static const profile = '/profile';

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
      GoRoute(
        path: profile,
        pageBuilder: (context, state) {
          return PageTransition.fade(
            page: const ProfilePage(),
          );
        },
      ),
    ],
  );
}
