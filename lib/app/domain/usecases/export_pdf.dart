import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../core/error/failures.dart';
import '../core/usecase.dart';
import '../entities/image_entity.dart';
import '../repositories/export_pdf_repository.dart';

class ExportPdfUsecase implements UseCase<Unit, Params> {
  ExportPdfUsecase(this.repository);
  final IExportPdfRepository repository;

  @override
  Future<Either<Failure, Unit>> call(Params params) {
    return repository.exportPdf(params.image, params.context);
  }
}

class Params extends Equatable {
  const Params({required this.context, required this.image});
  final BuildContext context;
  final ImageEntity image;

  @override
  List<Object> get props => [image, context];
}
