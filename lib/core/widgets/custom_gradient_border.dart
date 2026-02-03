import 'package:flutter/material.dart';

class CustomGradientBorder extends StatelessWidget {
  const CustomGradientBorder({
    super.key,
    required this.widget,
    required this.border,
    required this.linearGradient,
    this.height,
    this.width,
  });

  final Widget widget;
  final double border;
  final double? height;
  final double? width;
  final LinearGradient linearGradient;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(border, linearGradient),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: SizedBox(height: height, width: width, child: widget),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  GradientBorderPainter(this.border, this.linearGradient);

  final double border;
  final LinearGradient linearGradient;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final paint = Paint()
      ..shader = linearGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rrect = RRect.fromRectAndRadius(
      rect.deflate(1), // deflate half of strokeWidth
      Radius.circular(border),
    );

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
