// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:image_picker/image_picker.dart';

import '../../domain/entities/image_entity.dart';
import '../models/image_model.dart';

abstract class IGalleryDataSource {
  Future<ImageEntity?> pickImage();
}

class GalleryDataSource implements IGalleryDataSource {
  GalleryDataSource();

  @override
  Future<ImageEntity?> pickImage() async {
    try {
      final pickedImage = await ImagePicker.platform.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 100,
        maxWidth: 100,
      );
      if (pickedImage != null) {
        return ImageModel(imagePath: pickedImage.path);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
