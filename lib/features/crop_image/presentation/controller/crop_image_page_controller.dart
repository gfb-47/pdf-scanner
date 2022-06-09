import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../pages/crop_image_page.dart';

class CropImagePageController {
  CropImagePageController();
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
}
