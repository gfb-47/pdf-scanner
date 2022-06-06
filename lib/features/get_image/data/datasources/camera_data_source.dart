// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/image_entity.dart';
import '../models/image_model.dart';

abstract class ICameraDataSource {
  Future<ImageEntity> takePicture();
}

class CameraDatasource implements ICameraDataSource {
  CameraDatasource();

  @override
  Future<ImageEntity> takePicture() async {
    final pickedImage = await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxHeight: 100,
      maxWidth: 100,
    );
    if (pickedImage != null) {
      return ImageModel(imagePath: pickedImage.path);
    } else {
      throw CameraDatasourceFailure();
    }
  }
}
