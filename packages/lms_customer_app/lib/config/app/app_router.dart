import 'package:go_router/go_router.dart';

import '../../ui/auth/login/login_page.dart';
import '../../ui/auth/signup/signup_page.dart';
import '../page_transition/page_transition.dart';
import '../../ui/home/views/home_page.dart';

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
          final AuthorizedHomeParams? customerAuthorizedHomeParams =
              state.extra is AuthorizedHomeParams
                  ? state.extra as AuthorizedHomeParams
                  : null;
          return PageTransition.fade(
            page: HomePage(
              customerAuthorizedHomeParams: customerAuthorizedHomeParams,
            ),
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
