import 'dart:io';

import 'package:flutter/material.dart';

import '../../features/edit_image/presentation/edit_image_page.dart';
import '../../features/get_image/presentation/get_image_page.dart';
import 'route_strings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteStrings.getImage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => GetImagePage(),
        );

      case RouteStrings.editImage:
        if (args is File) {
          return MaterialPageRoute<dynamic>(
            builder: (_) => EditImagePage(
              args: args,
            ),
          );
        } else {
          return _errorRoute();
        }

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
