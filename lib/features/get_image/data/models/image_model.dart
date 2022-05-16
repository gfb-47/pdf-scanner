import '../../domain/entities/image_entity.dart';

class ImageModel implements ImageEntity {
  ImageModel({required this.imagePath});

  @override
  String imagePath;
}
