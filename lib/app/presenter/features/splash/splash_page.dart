import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/injection_container.dart';
import '../../core/navigator_service.dart';
import '../../core/routes/route_strings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static final _navigationService = sl<NavigationService>();

  @override
  void initState() {
    super.initState();
    Future<dynamic>.delayed(
      const Duration(seconds: 5),
      () => _navigationService.toNamed(RouteStrings.getImage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _loadAnimation(),
          ],
        ),
      ),
    );
  }

  LottieBuilder _loadAnimation() {
    return Lottie.asset(
      'assets/animations/scan.json',
    );
  }
}
