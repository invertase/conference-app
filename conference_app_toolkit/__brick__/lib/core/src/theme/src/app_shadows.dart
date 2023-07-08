import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  static BoxShadow get primaryBlack => const BoxShadow(
        color: Colors.black12,
        blurRadius: 40,
        spreadRadius: -15,
        offset: Offset(0, 0),
      );
  static BoxShadow get secondaryBlack => BoxShadow(
        color: Colors.black.withOpacity(.05),
        blurRadius: 40,
        spreadRadius: -10,
        offset: const Offset(0, 0),
      );
  static BoxShadow get primaryBlue => BoxShadow(
        color: AppColors.primaryColorMain.withOpacity(0.7),
        blurRadius: 30,
        spreadRadius: -5,
        offset: Offset.zero,
      );
  static BoxShadow get secondaryBlue => BoxShadow(
        color: AppColors.primaryColorMain.withOpacity(0.2),
        blurRadius: 20,
        spreadRadius: -5,
        offset: Offset.zero,
      );
  static BoxShadow get secondaryGreen => BoxShadow(
        color: AppColors.secondaryColorSecondary.withOpacity(0.4),
        blurRadius: 30,
        spreadRadius: -5,
        offset: Offset.zero,
      );
}
