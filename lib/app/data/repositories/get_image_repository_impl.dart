import 'package:dartz/dartz.dart';

import '../../domain/core/error/failures.dart';
import '../../domain/entities/image_entity.dart';
import '../../domain/repositories/get_image_repository.dart';
import '../datasources/camera_data_source.dart';
import '../datasources/gallery_data_source.dart';
import '../models/image_model.dart';

class GetImageRepository implements IGetImageRepository {
  GetImageRepository({
    required ICameraDataSource cameraDatasource,
    required IGalleryDatasource galleryDatasource,
  })  : _cameraDatasource = cameraDatasource,
        _galleryDataSource = galleryDatasource;

  final ICameraDataSource _cameraDatasource;
  final IGalleryDatasource _galleryDataSource;

  @override
  Future<Either<Failure, ImageEntity>> takePicture() async {
    ImageModel? image;
    try {
      final imagePath = (await _cameraDatasource.takePicture()).imagePath;
      image = ImageModel(imagePath: imagePath);
    } catch (e) {
      return Left(CameraDatasourceFailure());
    }
    return Right(image);
  }

  @override
  Future<Either<Failure, ImageEntity>> pickImage() async {
    ImageModel? image;
    try {
      final imagePath = (await _galleryDataSource.pickImage()).imagePath;
      image = ImageModel(imagePath: imagePath);
    } catch (e) {
      return Left(CameraDatasourceFailure());
    }
    return Right(image);
  }
}
