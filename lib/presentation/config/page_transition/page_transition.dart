import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class PageTransition extends Page<dynamic> {
  static Page<dynamic> fade({
    required Widget page,
  }) {
    return CustomTransitionPage(
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }

  static Page<dynamic> push({
    required Widget page,
  }) {
    return CustomTransitionPage(
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return CupertinoPageTransition(
          linearTransition: true,
          primaryRouteAnimation: animation,
          secondaryRouteAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }
}
