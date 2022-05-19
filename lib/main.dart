import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routes/route_generator.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: const HomePage(),
        theme: AppTheme.defaultTheme,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
