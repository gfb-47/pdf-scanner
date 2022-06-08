import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routes/route_generator.dart';
import 'features/get_image/presentation/get_image_page.dart';
import 'shared/theme/app_theme.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: GetImagePage(),
        theme: AppTheme.defaultTheme,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
