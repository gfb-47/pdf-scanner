import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/image_entity.dart';
import '../../../core/injection_container.dart';
import '../../../core/navigator_service.dart';
import '../../../core/routes/route_strings.dart';

class CropImagePageController {
  CropImagePageController();
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  static final _navigationService = sl<NavigationService>();

  void completeCrop(ImageEntity image) {
    _navigationService.toNamed(RouteStrings.editImage, arguments: image);
  }
}
