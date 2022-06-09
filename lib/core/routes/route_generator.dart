// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';

import '../../features/crop_image/presentation/pages/crop_image_page.dart';
import '../../features/get_image/data/models/image_model.dart';
import '../../features/get_image/presentation/pages/get_image_page.dart';
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
      case RouteStrings.cropImage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => CropImagePage(
            image: args as ImageModel,
          ),
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
