// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';
import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../domain/core/error/failures.dart';
import '../../domain/entities/image_entity.dart';

abstract class IExportPdfDatasource {
  Future<void> exportPdf(ImageEntity image);
  Future<void> createPdf(ImageEntity image);
  Future<void> savePdf();
}

class ExportPdfDatasource implements IExportPdfDatasource {
  ExportPdfDatasource();

  final pdf = pw.Document();

  @override
  Future<void> exportPdf(ImageEntity image) async {
    await createPdf(image);
    // ignore: use_build_context_synchronously
    await savePdf();
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
  Future<void> savePdf() async {
    try {
      final dir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();
      final fileDir = '${dir!.path}/${DateTime.now()}.pdf';
      final file = File(fileDir);
      await file.writeAsBytes(await pdf.save());
      final url = file.path;
      await OpenFile.open(url);
      log(url);
    } catch (e) {
      throw ExportPdfDatasourceFailure();
    }
  }
}
