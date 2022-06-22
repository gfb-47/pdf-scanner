// ignore_for_file: avoid_void_async

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigator_service.dart';
import 'core/routes/route_generator.dart';
import 'features/get_image/presentation/pages/get_image_page.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;
import 'shared/theme/app_colors.dart';
import 'shared/theme/app_theme.dart';

void main() async {
  await di.init();
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: GetImagePage(),
        theme: AppTheme.defaultTheme,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        navigatorKey: sl<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        
      ),
    ),
  );
}
