import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static navigateTo(String routeName, {Map<String, dynamic>? arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static navigateAndReplaceTo(String routeName,
      {Map<String, dynamic>? arguments}) {
    navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static replaceWith(String routeName, {Map<String, dynamic>? arguments}) {
    navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static goBack() {
    navigatorKey.currentState?.pop();
  }
}
