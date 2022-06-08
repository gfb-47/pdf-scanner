import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typograpies.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
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
      width: MediaQuery.of(context).size.width * 0.8,
      height: 60,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          side: BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        onPressed: onTap,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            const Icon(
              Icons.photo,
              size: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: AppTypographies.outlinedButtonText,
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
