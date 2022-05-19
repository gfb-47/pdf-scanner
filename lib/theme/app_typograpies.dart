import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypographies {
  static final TextStyle primaryButtonText = GoogleFonts.sourceSansPro(
    fontSize: 21,
    letterSpacing: 0.05,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteAlt,
  );

  static final TextStyle outlinedButtonText = GoogleFonts.sourceSansPro(
    fontSize: 21,
    letterSpacing: 0.05,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}
