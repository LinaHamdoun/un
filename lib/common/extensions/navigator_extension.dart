


import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  Future<T?> pushPage<T>(Widget page) {
    return Navigator.push<T>(
      this,
      PageRouteBuilder<T>(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),

        pageBuilder: (_, __, ___) => page,

        transitionsBuilder: (_, animation, __, child) {
          final begin = animation.status == AnimationStatus.reverse
              ? const Offset(-1.0, 0.0)
              : const Offset(1.0, 0.0);
          return SlideTransition(
            position: Tween<Offset>(
              begin: begin,
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
              reverseCurve: Curves.easeIn,
            )),
            child: child,
          );
        },
      ),
    );
  }
}
