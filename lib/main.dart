import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routes/route_generator.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
        child: MaterialApp(
      home: HomePage(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
    )),
  );
}
