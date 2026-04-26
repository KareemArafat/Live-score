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
        border: 500,
        linearGradient: AppColors.blueGradient,
        child: ClipOval(
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Transform.translate(
              offset: const Offset(0, 5),
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }
}
