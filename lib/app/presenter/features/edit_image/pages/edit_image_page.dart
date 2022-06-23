import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/image_entity.dart';
import '../../../core/injection_container.dart';
import '../../../core/navigator_service.dart';
import '../../../core/routes/route_strings.dart';
import '../../../shared/components/buttons/icon_button.dart';
import '../../../shared/theme/app_colors.dart';
import '../controller/edit_image_controller.dart';

class EditImagePage extends ConsumerWidget {
  EditImagePage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final ImageEntity image;
  final controller = sl<EditImagePageController>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Image'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.all(10),
            child: Consumer(builder: (context, ref, _) {
              final contrast = ref.watch(contrastProvider.state).state;
              return RepaintBoundary(
                key: controller.editKey,
                child: contrast
                    ? ColorFiltered(
                        colorFilter: GREYSCALE_MATRIX,
                        child: Image.file(
                          File(image.imagePath),
                          fit: BoxFit.cover,
                          height: double.infinity,
                          filterQuality: FilterQuality.high,
                        ),
                      )
                    : Image.file(
                        File(image.imagePath),
                        fit: BoxFit.cover,
                        height: double.infinity,
                        filterQuality: FilterQuality.high,
                      ),
              );
            }),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircularIconButton(
                    iconSize: 32,
                    icon: Icons.contrast,
                    backgroundColor: AppColors.primaryAlt,
                    splashColor: AppColors.black,
                    color: AppColors.white,
                    function: () => controller.toggleContrast(ref)),
                const SizedBox(
                  width: 16,
                ),
                CustomCircularIconButton(
                  iconSize: 32,
                  icon: Icons.rotate_right,
                  backgroundColor: AppColors.primaryAlt,
                  splashColor: AppColors.black,
                  color: AppColors.white,
                  function: () {},
                ),
                const SizedBox(
                  width: 16,
                ),
                CustomCircularIconButton(
                  iconSize: 32,
                  icon: Icons.task_alt,
                  backgroundColor: AppColors.primaryAlt,
                  splashColor: AppColors.black,
                  color: AppColors.white,
                  function: () => controller.convertWidgetToImage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
