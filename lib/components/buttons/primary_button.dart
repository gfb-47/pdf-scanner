import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typograpies.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.icon,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      height: 60,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: onTap,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            const Icon(
              Icons.camera_alt_outlined,
              size: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: AppTypographies.primaryButtonText,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
