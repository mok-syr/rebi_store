import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class Nav {
  static push(Widget widget) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
    }
  }

  static pushReplacement(Widget widget) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
    }
  }

  static pop() {
    if (navigatorKey.currentState != null) navigatorKey.currentState!.pop();
  }

  static pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.pushNamed(
        routeName,
        arguments: arguments,
      );
    }
  }

  static pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState!.pushReplacementNamed(
        routeName,
        result: result,
        arguments: arguments,
      );
    }
  }

  static BuildContext getContext() {
    // if (navigatorKey.currentState != null) return navigatorKey.currentState!.context;
    return navigatorKey.currentState!.context;
  }
}
