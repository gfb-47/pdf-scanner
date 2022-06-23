// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../domain/core/error/failures.dart';
import '../../domain/entities/image_entity.dart';

abstract class IExportPdfDatasource {
  Future<Unit> exportPdf(ImageEntity image, BuildContext context);
  Future<void> createPdf(ImageEntity image);
  Future<void> savePdf(BuildContext context);
}

class ExportPdfDatasource implements IExportPdfDatasource {
  ExportPdfDatasource();

  final pdf = pw.Document();

  @override
  Future<Unit> exportPdf(ImageEntity image, BuildContext context) async {
    await createPdf(image);
    // ignore: use_build_context_synchronously
    await savePdf(context);
    return unit;
  }

  @override
  Future<void> createPdf(ImageEntity image) async {
    try {
      final imagetoExport = pw.MemoryImage(
        File(image.imagePath).readAsBytesSync(),
      );
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(imagetoExport),
            );
          },
        ),
      );
    } catch (e) {
      throw ExportPdfDatasourceFailure();
    }
  }

  @override
  Future<void> savePdf(BuildContext context) async {
    try {
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/file.pdf');
      await file.writeAsBytes(await pdf.save());
    } catch (e) {
      throw ExportPdfDatasourceFailure();
    }
  }
}
