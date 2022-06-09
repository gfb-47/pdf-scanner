import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../core/navigator_service.dart';
import '../../../../shared/components/dialog/error_dialog.dart';
import '../../../../shared/components/buttons/primary_button.dart';
import '../../../../core/routes/route_strings.dart';
import '../../../../injection_container.dart';
import '../../domain/repositories/get_image_repository.dart';

class HomePageController {
  HomePageController({required IGetImageRepository getImageRepository})
      : _getImageRepository = getImageRepository;
  final IGetImageRepository _getImageRepository;

  static final _navigationService = sl<NavigationService>();
  File? image;

  Future<void> takePicture(BuildContext context) async {
    final response = await _getImageRepository.takePicture();
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
      },
    );
  }

  Future<void> pickImage(BuildContext context) async {
    final response = await _getImageRepository.pickImage();
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
        sl<NavigationService>()
            .toNamed(RouteStrings.cropImage, arguments: image);
      },
    );
  }
}
