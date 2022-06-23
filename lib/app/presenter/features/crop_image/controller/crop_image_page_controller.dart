import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/image_entity.dart';
import '../../../core/injection_container.dart';
import '../../../core/navigator_service.dart';
import '../../../core/routes/route_strings.dart';
import '../pages/crop_image_page.dart';
import '../utils/crop_editor_helper.dart';

class CropImagePageController {
  CropImagePageController();
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  static final _navigationService = sl<NavigationService>();
  bool _cropping = false;

  void completeCrop(ImageEntity image) {
    _navigationService.toNamed(RouteStrings.editImage, arguments: image);
  }

  Future<void> cropImage(bool useNative, ImageEntity image) async {
    if (_cropping) {
      return;
    }
    String msg = '';
    try {
      _cropping = true;

      Uint8List? fileData;

      fileData =
          await cropImageDataWithDartLibrary(state: editorKey.currentState!);
      final String? filePath =
          await ImageSaver.save('imagem_cortada.jpg', fileData!);
      msg = 'Imagem salva: $filePath';
      image.imagePath = filePath!;

      completeCrop(image);
    } catch (e, stack) {
      msg = 'Falha: $e\n $stack';
      print(msg);
    }

    _cropping = false;
  }
}
