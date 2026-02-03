import 'package:flutter/material.dart';

class CustomGradientWidget extends StatelessWidget {
  const CustomGradientWidget({
    super.key,
    required this.widget,
    required this.linearGradient,
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
