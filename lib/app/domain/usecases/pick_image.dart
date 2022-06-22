import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../core/error/failures.dart';
import '../core/usecase.dart';
import '../entities/image_entity.dart';
import '../repositories/get_image_repository.dart';

class PickImageUsecase implements UseCase<ImageEntity, Params> {
  PickImageUsecase(this.repository);
  final IGetImageRepository repository;

  @override
  Future<Either<Failure, ImageEntity>> call(Params params) {
    return repository.pickImage();
  }
}

class Params extends Equatable {
  const Params({required this.image});
  final ImageEntity image;

  @override
  List<Object> get props => [image];
}
