import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    this.size = 5,
    this.withSecColor = false,
  });
  final double size;
  final bool withSecColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeAlign: size,
        strokeWidth: 2,
        backgroundColor: withSecColor
            ? AppColors.secColor1
            : AppColors.baseColor1,
        color: withSecColor ? AppColors.secColor2 : AppColors.baseColor2,
      ),
    );
  }
}
