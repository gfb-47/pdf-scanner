import 'dart:io';

import 'package:flutter/material.dart';

import '../../../shared/components/dialog/error_dialog.dart';
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

  Future<void> takePicture(BuildContext context) async {
    final response = await repository.takePicture();
    response.fold(
      (l) {
        ErrorDialog.showErrorDialog(
          context,
          'Failure on Taking Picture',
          'Sorry for the failure, please try again or send us a report.',
        );
      },
      (image) {
        this.image = File(image.imagePath);
        Navigator.pushNamed(
          context,
          '/edit_image',
          arguments: this.image,
        );
      },
    );
  }

  Future<void> pickImage(BuildContext context) async {
    final response = await repository.pickImage();
    response.fold(
      (l) {
        ErrorDialog.showErrorDialog(
          context,
          'Failure on Picking Image from Gallery',
          'Sorry for the failure, please try again or send us a report.',
        );
      },
      (image) {
        this.image = File(image.imagePath);
        Navigator.pushNamed(
          context,
          '/edit_image',
          arguments: this.image,
        );
      },
    );
  }
}
