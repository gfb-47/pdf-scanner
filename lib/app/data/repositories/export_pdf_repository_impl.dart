import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/core/error/failures.dart';
import '../../domain/entities/image_entity.dart';
import '../../domain/repositories/export_pdf_repository.dart';
import '../datasources/export_pdf_data_source.dart';

class ExportPdfRepository implements IExportPdfRepository {
  ExportPdfRepository({
    required IExportPdfDatasource exportPdfDatasource,
  }) : _exportPdfDatasource = exportPdfDatasource;

  final IExportPdfDatasource _exportPdfDatasource;

  @override
  Future<Either<Failure, Unit>> exportPdf(
      ImageEntity image, BuildContext context) async {
    try {
      await _exportPdfDatasource.exportPdf(image);
      return const Right(unit);
    } catch (e) {
      return Left(ExportPdfDatasourceFailure());
    }
  }
}
