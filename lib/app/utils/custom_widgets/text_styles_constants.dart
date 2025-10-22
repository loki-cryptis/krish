import 'package:flutter/material.dart';
import 'package:krish/app/utils/all_constants/app_colors.dart';

class TextStylesConstants {
  // Dynamic helpers: supply only fontSize
  static TextStyle textWhite(double fontSize, {FontWeight weight = FontWeight.w400}) =>
      TextStyle(fontSize: fontSize, fontWeight: weight, color: AppColors.white);

  static TextStyle textBlack(double fontSize, {FontWeight weight = FontWeight.w400}) =>
      TextStyle(fontSize: fontSize, fontWeight: weight, color: AppColors.black);

  // Convenience: normal, semibold, bold by fontSize only
  static TextStyle textWhiteNormal(double fontSize) =>
      TextStyle(fontSize: fontSize, fontWeight: FontWeight.w400, color: AppColors.white);

  static TextStyle textWhiteSemiBold(double fontSize) =>
      TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600, color: AppColors.white);

  static TextStyle textWhiteBold(double fontSize) =>
      TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: AppColors.white);

  static TextStyle textBlackNormal(double fontSize) =>
      TextStyle(fontSize: fontSize, fontWeight: FontWeight.w400, color: AppColors.black);

  static TextStyle textBlackSemiBold(double fontSize) =>
      TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600, color: AppColors.black);

  static TextStyle textBlackBold(double fontSize) =>
      TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: AppColors.black);
}