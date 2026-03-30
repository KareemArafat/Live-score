import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';

class CustomGradientWidget extends StatelessWidget {
  const CustomGradientWidget({
    super.key,
    required this.widget,
    this.linearGradient = AppColors.blueGradient,
  });
  final Widget widget;
  final LinearGradient linearGradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => linearGradient.createShader(bounds),
      child: widget,
    );
  }
}
