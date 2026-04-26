import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_gradient_widget.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomGradientWidget(
        linearGradient: AppColors.greenGradient,
        widget: Text(
          title,
          style: AppStyles.heading16(context).copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
