import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';

abstract class AppStyles {
  // 🔹 Core builder
  static TextStyle _style(
    BuildContext context, {
    required num size,
    required Color color,
    FontWeight? weight,
  }) {
    return TextStyle(
      fontSize: context.sp(size),
      color: color,
      fontWeight: weight,
    );
  }

  // 🔹 Headings
  static TextStyle heading18(BuildContext context) =>
      _style(context, size: 18, color: Colors.white, weight: FontWeight.w500);

  static TextStyle heading16(BuildContext context) =>
      _style(context, size: 16, color: Colors.white, weight: FontWeight.w500);

  // 🔹 Body
  static TextStyle body14(BuildContext context) =>
      _style(context, size: 14, color: Colors.white);

  static TextStyle body12(BuildContext context) =>
      _style(context, size: 12, color: Colors.white);

  static TextStyle body10(BuildContext context) =>
      _style(context, size: 10, color: Colors.white);

  static TextStyle body9(BuildContext context) =>
      _style(context, size: 9, color: AppColors.grayColor);

  // 🔹 Variants
  static TextStyle blockBody12(BuildContext context) =>
      _style(context, size: 12, color: Colors.black);

  static TextStyle grayBody12(BuildContext context) =>
      _style(context, size: 12, color: AppColors.grayColor);

  static TextStyle blockBody10(BuildContext context) =>
      _style(context, size: 10, color: Colors.black);

  static TextStyle grayBody10(BuildContext context) =>
      _style(context, size: 10, color: AppColors.grayColor);
}
