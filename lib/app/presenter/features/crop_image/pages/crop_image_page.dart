import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../../domain/entities/image_entity.dart';
import '../../../core/injection_container.dart';
import '../../../shared/theme/app_colors.dart';
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
          title: const Text('Cortar Imagem'),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primary),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () => controller.cropImage(false, image),
              child: const Text(
                'Finish',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: ButtonTheme(
            minWidth: 0.0,
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButtonWithIcon(
                  icon: Icon(
                    Icons.flip,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  label: Text(
                    'Flip',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: AppColors.primaryAlt,
                    ),
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    controller.editorKey.currentState!.flip();
                  },
                ),
                FlatButtonWithIcon(
                  icon: Icon(
                    Icons.rotate_left,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  label: Text(
                    'Rotate Left',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: AppColors.primaryAlt,
                    ),
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    controller.editorKey.currentState!.rotate(right: false);
                  },
                ),
                FlatButtonWithIcon(
                  icon: Icon(
                    Icons.rotate_right,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  label: Text(
                    'Rotate Right',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: AppColors.primaryAlt,
                    ),
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    controller.editorKey.currentState!.rotate();
                  },
                ),
                FlatButtonWithIcon(
                  icon: Icon(
                    Icons.restore,
                    color: AppColors.primary,
                  ),
                  label: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: AppColors.primaryAlt,
                    ),
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    controller.editorKey.currentState!.reset();
                  },
                ),
              ],
            ),
          ),
        ),
        body: ExtendedImage.file(
          File(image.imagePath),
          fit: BoxFit.contain,
          cacheRawData: true,
          mode: ExtendedImageMode.editor,
          extendedImageEditorKey: controller.editorKey,
          initEditorConfigHandler: (state) {
            return EditorConfig(
              maxScale: 8.0,
              cornerColor:
                  AppColors.primary, //Cor das bordas (que agr é amarela)
              cornerSize: const Size(20, 5), //Tamanho das bordas amarela
              lineColor: Colors.transparent,
              lineHeight: 5, //Tamanho da borda roxa + grid
              cropRectPadding: const EdgeInsets.all(50.0),
            );
          },
        ));
  }
}

class FlatButtonWithIcon extends TextButton {
  FlatButtonWithIcon({
    Key? key,
    required VoidCallback onPressed,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    Color? textColor,
    required Widget icon,
    required Widget label,
  }) : super(
          key: key,
          onPressed: onPressed,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          style: textColor != null
              ? ButtonStyle(
                  textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: textColor),
                ))
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icon,
              const SizedBox(height: 5.0),
              label,
            ],
          ),
        );
}

class ImageSaver {
  const ImageSaver._();

  static Future<String?> save(String name, Uint8List fileData) async {
    final String title = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final AssetEntity? imageEntity = await PhotoManager.editor.saveImage(
      fileData,
      title: title,
    );
    final File? file = await imageEntity?.file;
    return file?.path;
  }
}
