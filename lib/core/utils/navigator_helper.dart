import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Future<void> push({
    required Widget screen,
    RouteTransitionsBuilder? transitionBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) async {
    if (transitionBuilder != null) {
      await navigatorKey.currentState!.push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionDuration: transitionDuration,
          transitionsBuilder: transitionBuilder,
        ),
      );
    } else {
      await navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (BuildContext context) => screen),
      );
    }
  }

  // Push replacement with animation options
  static Future<void> pushReplacement({
    required Widget screen,
    RouteTransitionsBuilder? transitionBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) async {
    if (transitionBuilder != null) {
      await navigatorKey.currentState!.pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionDuration: transitionDuration,
          transitionsBuilder: transitionBuilder,
        ),
      );
    } else {
      await navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => screen),
      );
    }
  }

  // Pop remains the same
  static dynamic pop({dynamic object}) {
    return navigatorKey.currentState!.pop<dynamic>(object);
  }

  // Push and remove all with animation options
  static dynamic pushAndRemoveAll({
    required Widget screen,
    RouteTransitionsBuilder? transitionBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    if (transitionBuilder != null) {
      return navigatorKey.currentState!.pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionDuration: transitionDuration,
          transitionsBuilder: transitionBuilder,
        ),
        (Route route) => false,
      );
    } else {
      return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext c) => screen),
        (Route route) => false,
      );
    }
  }

  static RouteTransitionsBuilder get cupertinoTransition => (
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    final slideInAnimation = Tween(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(animation);

    final slideOutAnimation = Tween(
      begin: Offset.zero,
      end: const Offset(-0.3, 0.0),
    ).animate(secondaryAnimation);

    return SlideTransition(
      position: slideOutAnimation,
      child: SlideTransition(position: slideInAnimation, child: child),
    );
  };
}
