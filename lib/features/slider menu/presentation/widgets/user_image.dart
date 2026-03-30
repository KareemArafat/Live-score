import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomGradientBorder(
        linearGradient: AppColors.blueGradient,
        border: 500,
        widget: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(image),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
