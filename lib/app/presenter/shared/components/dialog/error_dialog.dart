import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typograpies.dart';

class ErrorDialog {
  static Future<void> showErrorDialog(
    BuildContext context,
    String title,
    String content,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style:
                AppTypographies.dialogTitle.copyWith(color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  content,
                  style: AppTypographies.dialogContent,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.primary),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
