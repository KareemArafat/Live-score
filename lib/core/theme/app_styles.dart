import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';

class AppStyles {
  AppStyles._();

  static const heading18 = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const heading16 = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const body14 = TextStyle(fontSize: 14, color: Colors.white);

  static const body12 = TextStyle(fontSize: 12, color: Colors.white);
  static const blockBody12 = TextStyle(fontSize: 12, color: Colors.black);
  static const grayBody12 = TextStyle(fontSize: 12, color: AppColors.grayColor);

  static const body10 = TextStyle(fontSize: 10, color: Colors.white);
  static const blockBody10 = TextStyle(fontSize: 10, color: Colors.black);
  static const grayBody10 = TextStyle(fontSize: 10, color: AppColors.grayColor);

  static const body9 = TextStyle(fontSize: 9, color: AppColors.grayColor);
}
