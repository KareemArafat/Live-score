import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: context.rMin(2)),
      height: context.rMin(12),
      width: context.rMin(isActive ? 20 : 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.grayColor,
        gradient: isActive ? AppColors.blueGradient : null,
      ),
    );
  }
}
