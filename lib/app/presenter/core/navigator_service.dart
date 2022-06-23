import 'package:flutter/material.dart';

class NavigationService {
  NavigationService();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> toNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void back() {
    return navigatorKey.currentState!.pop();
  }
}
