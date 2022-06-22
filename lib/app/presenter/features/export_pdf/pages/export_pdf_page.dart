import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../domain/entities/image_entity.dart';
import '../../../core/injection_container.dart';
import '../../../shared/components/buttons/icon_button.dart';
import '../../../shared/theme/app_colors.dart';
import '../controller/export_pdf_controller.dart';

class ExportPdfPage extends StatelessWidget {
  ExportPdfPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final ImageEntity image;
  final controller = sl<ExportPdfController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export PDF'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.all(10),
            child: Image.file(
              File(image.imagePath),
              fit: BoxFit.cover,
              height: double.infinity,
              filterQuality: FilterQuality.high,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircularIconButton(
                  iconSize: 32,
                  icon: Icons.picture_as_pdf,
                  backgroundColor: AppColors.primaryAlt,
                  splashColor: AppColors.black,
                  color: AppColors.white,
                  function: () {
                    controller.exportToPdf(image, context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
