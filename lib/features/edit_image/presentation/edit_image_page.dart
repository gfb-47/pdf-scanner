import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../shared/components/buttons/icon_button.dart';
import '../../../shared/theme/app_colors.dart';

class EditImagePage extends HookWidget {
  const EditImagePage({
    Key? key,
    required this.args,
  }) : super(key: key);
  final File args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Image'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.all(10),
            child: Image.file(
              args,
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
                  icon: Icons.contrast,
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
                  icon: Icons.rotate_right,
                  backgroundColor: AppColors.primaryAlt,
                  splashColor: AppColors.black,
                  color: AppColors.white,
                  function: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
