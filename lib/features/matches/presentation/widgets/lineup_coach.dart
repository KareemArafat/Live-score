import 'package:flutter/cupertino.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/shard/widgets/player_image.dart';

class LineupCoach extends StatelessWidget {
  const LineupCoach({
    super.key,
    required this.coachName,
    required this.coachImage,
  });
  final String coachName;
  final String coachImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(12),
        vertical: context.h(8),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: AppColors.blueGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Coach', style: AppStyles.heading16(context)),
          SizedBox(height: context.h(10)),
          Row(
            children: [
              PlayerImage(image: coachName, radius: context.rMin(18)),
              SizedBox(width: context.w(12)),
              Text(coachImage, style: AppStyles.body12(context)),
            ],
          ),
        ],
      ),
    );
  }
}
