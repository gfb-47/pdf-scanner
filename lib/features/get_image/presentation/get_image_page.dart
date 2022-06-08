import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/components/buttons/outlined_button.dart';
import '../../../shared/components/buttons/primary_button.dart';
import '../../../shared/theme/app_typograpies.dart';
import 'get_image_controller.dart';

class GetImagePage extends HookWidget {
  GetImagePage({
    Key? key,
  }) : super(key: key);
  final controller = GetImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Scanner'),
      ),
      body: Align(
        child: Column(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Lottie.asset(
                'assets/animations/splash.json',
                height: 200,
              ),
            ),
            PrimaryButton(
              onTap: () => controller.takePicture(context),
              text: 'Take Picture',
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                'ou',
                style: AppTypographies.normalText,
              ),
            ),
            CustomOutlinedButton(
              onTap: () => controller.pickImage(context),
              text: 'Choose From Gallery',
            ),
          ],
        ),
      ),
    );
  }
}
