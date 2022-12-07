import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);

  @override
  Color get barrierColor => Colors.white;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    // ここを変えればいろんなトランジションにできるぞ
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(
    milliseconds: 1000, // ミリ秒でトランジションにかかる時間を指定
  );
}