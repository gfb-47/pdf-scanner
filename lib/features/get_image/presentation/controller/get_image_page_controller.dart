import 'dart:io';

import '../../../../core/navigator_service.dart';
import '../../../../core/routes/route_strings.dart';
import '../../../../injection_container.dart';
import '../../domain/repositories/get_image_repository.dart';

class HomePageController {
  HomePageController({required IGetImageRepository getImageRepository})
      : _getImageRepository = getImageRepository;
  final IGetImageRepository _getImageRepository;

  static final _navigationService = sl<NavigationService>();
  File? image;

  Future<void> takePicture() async {
    final response = await _getImageRepository.takePicture();
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
    final response = await _getImageRepository.pickImage();
    response.fold(
      (l) {
        print('Probleminha');
      },
      (image) {
        this.image = File(image.imagePath);
        sl<NavigationService>()
            .toNamed(RouteStrings.cropImage, arguments: image);
      },
    );
  }
}
