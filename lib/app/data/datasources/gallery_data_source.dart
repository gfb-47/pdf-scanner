// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:image_picker/image_picker.dart';

import '../../domain/core/error/failures.dart';
import '../../domain/entities/image_entity.dart';
import '../models/image_model.dart';

abstract class IGalleryDatasource {
  Future<ImageEntity> pickImage();
}

class GalleryDatasource implements IGalleryDatasource {
  GalleryDatasource();

  @override
  Future<ImageEntity> pickImage() async {
    final pickedImage = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (pickedImage != null) {
      return ImageModel(imagePath: pickedImage.path);
    } else {
      throw GalleryDatasourceFailure();
    }
  }
}
