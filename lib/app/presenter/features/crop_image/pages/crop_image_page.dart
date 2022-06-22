import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/image_entity.dart';
import '../../../core/injection_container.dart';
import '../../../shared/components/buttons/primary_button.dart';
import '../controller/crop_image_page_controller.dart';

class CropImagePage extends StatelessWidget {
  CropImagePage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final ImageEntity image;
  final controller = sl<CropImagePageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Image'),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: PrimaryButton(
          text: 'Continue',
          onTap: () => controller.completeCrop(image),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: ExtendedImage.file(
          File(image.imagePath),
          fit: BoxFit.contain,
          mode: ExtendedImageMode.editor,
          extendedImageEditorKey: controller.editorKey,
          initEditorConfigHandler: (state) {
            return EditorConfig(
              maxScale: 8.0,
            );
          },
        ),
      ),
    );
  }
}
