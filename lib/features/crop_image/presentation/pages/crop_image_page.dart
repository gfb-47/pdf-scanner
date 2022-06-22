import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:pdf_scanner/features/crop_image/presentation/pages/crop_editor_helper.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../../injection_container.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../get_image/domain/entities/image_entity.dart';
import '../controller/crop_image_page_controller.dart';

class CropImagePage extends StatelessWidget {
  CropImagePage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final ImageEntity image;
  bool _cropping = false;
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
              onPressed: () => _cropImage(false),
              child: const Text(
                'Finalizar',
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
                    'Espelhar',
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
                    'Girar Esquerda',
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
                    'Girar Direita',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: AppColors.primaryAlt,
                    ),
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    controller.editorKey.currentState!.rotate(right: true);
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
              cornerSize: Size(20, 5), //Tamanho das bordas amarela
              lineColor: Colors.transparent,
              lineHeight: 5, //Tamanho da borda roxa + grid
              cropRectPadding: EdgeInsets.all(50.0),
              hitTestSize: 20.0,
            );
          },
        ));
  }

  Future<void> _cropImage(bool useNative) async {
    if (_cropping) {
      return;
    }
    String msg = '';
    try {
      _cropping = true;

      //await showBusyingDialog();

      Uint8List? fileData;

      ///delay due to cropImageDataWithDartLibrary is time consuming on main thread
      ///it will block showBusyingDialog
      ///if you don't want to block ui, use compute/isolate,but it costs more time.
      //await Future.delayed(Duration(milliseconds: 200));

      ///if you don't want to block ui, use compute/isolate,but it costs more time.
      fileData = await cropImageDataWithDartLibrary(
          state: controller.editorKey.currentState!);
      final String? filePath =
          await ImageSaver.save('cropped_picture.jpg', fileData!);
      // var filePath = await ImagePickerSaver.saveFile(fileData: fileData);

      msg = 'save image : $filePath';
    } catch (e, stack) {
      msg = 'save failed: $e\n $stack';
      print(msg);
    }

    //Navigator.of(context).pop();
    // showToast(msg);
    _cropping = false;
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