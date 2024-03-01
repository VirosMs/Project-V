import 'package:flutter/material.dart';

/// A service class for navigating between screens in the app.
class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Pushes a new route onto the navigator stack.
  ///
  /// The [routeName] parameter specifies the name of the route to push.
  /// The [arguments] parameter is an optional argument to pass to the route.
  static Future<dynamic> pushNamed(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  /// Pops the current route off the navigator stack.
  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  /// Pushes a new route onto the navigator stack and removes all the previous routes until a certain condition is met.
  ///
  /// The [routeName] parameter specifies the name of the route to push.
  /// The [routePredicate] parameter is a boolean function that determines when to stop removing routes.
  /// The [arguments] parameter is an optional argument to pass to the route.
  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate,
        arguments: arguments);
  }

  /// Pops the current route off the navigator stack and pushes a new route onto the stack.
  ///
  /// The [routeName] parameter specifies the name of the route to push.
  /// The [arguments] parameter is an optional argument to pass to the route.
  static Future<dynamic> popAndPushNamed(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }
}
