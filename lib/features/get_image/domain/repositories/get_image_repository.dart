import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/image_entity.dart';

abstract class PickImageRepository {
  Future<Either<Failure, ImageEntity>> takePicture();
  Future<Either<Failure, ImageEntity>> pickImage();
}
