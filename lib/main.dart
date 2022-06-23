// ignore_for_file: avoid_void_async

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/presenter/core/injection_container.dart' as di;
import 'app/presenter/core/navigator_service.dart';
import 'app/presenter/core/routes/route_generator.dart';
import 'app/presenter/features/splash/splash_page.dart';
import 'app/presenter/shared/theme/app_theme.dart';

void main() async {
  await di.init();
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: const SplashPage(),
        theme: AppTheme.defaultTheme,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        navigatorKey: di.sl<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
