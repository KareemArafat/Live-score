import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key, this.onTap, required this.widget});
  final void Function()? onTap;
  final Widget widget;

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with SingleTickerProviderStateMixin {
  final radius = BorderRadius.circular(100);
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1600),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        margin: EdgeInsets.symmetric(horizontal: context.w(8)),
        decoration: BoxDecoration(
          gradient: AppColors.blueGradient,
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: AppColors.baseColor1.withAlpha(120),
              blurRadius: 0 + (controller.value * 15),
              spreadRadius: 1 + (controller.value * 2),
            ),
            BoxShadow(
              color: AppColors.baseColor2.withAlpha(120),
              blurRadius: 0 + (controller.value * 15),
              spreadRadius: 1 + (controller.value * 2),
            ),
          ],
        ),
        child: child,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: widget.onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.w(12),
              vertical: context.h(10),
            ),
            child: widget.widget,
          ),
        ),
      ),
    );
  }
}
