import 'package:flutter/material.dart';

import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/image_model.dart';
import '../../../../domain/entities/image_entity.dart';
import '../../../core/injection_container.dart';
import '../../../core/navigator_service.dart';
import '../../../core/routes/route_strings.dart';
import '../../crop_image/pages/crop_image_page.dart';
import '../../crop_image/utils/crop_editor_helper.dart';
import 'dart:ui' as ui;

const GREYSCALE_MATRIX = ColorFilter.matrix([
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
]);

final contrastProvider = StateProvider((ref) => true);

class EditImagePageController {
  EditImagePageController();
  final GlobalKey editKey = GlobalKey();
  static final _navigationService = sl<NavigationService>();

  void completeEdit(ImageEntity image) {
    _navigationService.toNamed(
      RouteStrings.exportPdf,
      arguments: image,
    );
  }

  void toggleContrast(WidgetRef ref) {
     ref.read(contrastProvider.state).state =
        !ref.read(contrastProvider.state).state;
  }

  void convertWidgetToImage() async {
    String? msg;
    try {
      RenderRepaintBoundary repaintBoundary =
          (editKey.currentContext!.findRenderObject() as RenderRepaintBoundary);
      ui.Image boxImage = await repaintBoundary.toImage(pixelRatio: 1);
      ByteData? byteData =
          await boxImage.toByteData(format: ui.ImageByteFormat.png);
      Uint8List uint8list = byteData!.buffer.asUint8List();
      final String? filePath =
          await ImageSaver.save('imagem_cortada.jpg', uint8list);
      msg = 'Imagem salva: $filePath';
      var image = ImageModel(imagePath: '');
      image.imagePath = filePath!;

      completeEdit(image);
    } catch (e, stack) {
      msg = 'Falha: $e\n $stack';
      print(msg);
    }
    // You can now use this to save the Image to Local Storage or upload it to a Remote Server.
  }
}
