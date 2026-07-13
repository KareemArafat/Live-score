import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';

class LeagueTitle extends StatelessWidget {
  const LeagueTitle({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomGradientBorder(
        linearGradient: AppColors.blueGradient,
        border: 8,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.w(8),
            vertical: context.h(12),
          ),
          child: Row(
            children: [
              CustomNetworkImage(imageUrl: image, size: context.rMin(24)),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  leagueNameSplit(name),
                  style: AppStyles.heading16(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
