import 'dart:io';

import '../data/datasources/camera_data_source.dart';
import '../data/datasources/gallery_data_source.dart';
import '../data/repositories/get_image_repository_impl.dart';
import '../domain/repositories/get_image_repository.dart';

class GetImageController {
  GetImageController();

  final IGetImageRepository repository = GetImageRepository(
    cameraDatasource: CameraDatasource(),
    galleryDatasource: GalleryDatasource(),
  );
  File? image;

  Future<void> takePicture() async {
    final response = await repository.takePicture();
    response.fold(
      (l) {
        print('Probleminha');
      },
      (image) {
        this.image = File(image.imagePath);
      },
    );
  }

  Future<void> pickImage() async {
    final response = await repository.pickImage();
    response.fold(
      (l) {
        print('Probleminha');
      },
      (image) {
        this.image = File(image.imagePath);
      },
    );
  }
}
