import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/pick_image/presentation/pages/pick_image_page.dart';

class RouteGenerator {
  static void a(BuildContext context) {
    Navigator.pushNamed(context, '/pick_image');
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomePage(),
        );
      case '/pick_image':
        return MaterialPageRoute<dynamic>(
          builder: (_) => const PickImagePage(),
        );

      // if (args is String) {
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => SecondPage(
      //       data: args,
      //     ),
      //   );
      // }
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      // return _errorRoute();

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      );
    });
  }
}