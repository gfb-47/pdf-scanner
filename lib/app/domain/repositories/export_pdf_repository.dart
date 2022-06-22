import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../core/error/failures.dart';
import '../entities/image_entity.dart';

abstract class IExportPdfRepository {
  Future<Either<Failure, Unit>> exportPdf(
      ImageEntity image, BuildContext context);
}
