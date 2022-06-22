import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../domain/entities/image_entity.dart';
import '../../../../domain/repositories/export_pdf_repository.dart';
import '../../../core/injection_container.dart';
import '../../../core/navigator_service.dart';
import '../../../core/routes/route_strings.dart';

class ExportPdfController {
  ExportPdfController({required IExportPdfRepository exportPdfRepository})
      : _exportPdfRepository = exportPdfRepository;

  static final _navigationService = sl<NavigationService>();
  final pdf = pw.Document();
  final IExportPdfRepository _exportPdfRepository;

  Future<void> exportToPdf(ImageEntity image, BuildContext context) async {
    try {
      await _exportPdfRepository.exportPdf(image, context);
      _navigationService.toNamed(RouteStrings.getImage);
      // ignore: avoid_dynamic_calls, use_build_context_synchronously
      await Flushbar<dynamic>(
        title: 'Success',
        message: 'PDF created with success on your documents.',
        duration: const Duration(seconds: 3),
      ).show(context);
    } catch (e) {
      // ignore: avoid_dynamic_calls
      await Flushbar<dynamic>(
        title: 'Error',
        message: 'Can not convert to PDF.',
        duration: const Duration(seconds: 3),
      ).show(context);
    }
  }
}
