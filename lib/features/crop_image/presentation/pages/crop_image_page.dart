import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../components/buttons/outlined_button.dart';
import '../../../../components/buttons/primary_button.dart';
import '../../../../injection_container.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_typograpies.dart';
import '../../../get_image/domain/entities/image_entity.dart';
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
        bottomNavigationBar: TextButton(
          child: Text('aaa'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primary),
          ),
          onPressed: () => null,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          decoration: BoxDecoration(
              border: Border.all(
            color: AppColors.black,
            width: 2,
          )),
          child: ExtendedImage.file(
            File(image.imagePath),
            fit: BoxFit.contain,
            mode: ExtendedImageMode.editor,
            extendedImageEditorKey: controller.editorKey,
            initEditorConfigHandler: (state) {
              return EditorConfig(
                maxScale: 8.0,
                cropRectPadding: EdgeInsets.all(20.0),
                hitTestSize: 20.0,
              );
            },
          ),
        ));
  }
}
