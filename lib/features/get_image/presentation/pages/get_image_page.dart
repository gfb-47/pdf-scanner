import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pdf_scanner/injection_container.dart';

import '../../../../shared/components/buttons/primary_button.dart';
import '../../../../shared/components/buttons/outlined_button.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_typograpies.dart';
import '../controller/get_image_page_controller.dart';

class GetImagePage extends StatelessWidget {
  GetImagePage({
    Key? key,
  }) : super(key: key);
  final controller = sl<HomePageController>();
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
              onTap: () => controller.takePicture(),
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
              onTap: () => controller.pickImage(),
              text: 'Choose From Gallery',
            ),
          ],
        ),
      ),
    );
  }
}
