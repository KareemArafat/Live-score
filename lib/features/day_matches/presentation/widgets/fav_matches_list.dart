import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/core/widgets/custom_gradient_widget.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/widgets/match_result_row.dart';

class FavMatchesList extends StatelessWidget {
  const FavMatchesList({super.key, required this.favMatches});
  final List<MatchEntity> favMatches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: context.h(30)),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: favMatches.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
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
                    CustomGradientWidget(
                      child: Icon(Icons.star_rate_rounded, size: 35),
                      linearGradient: AppColors.blueGradient,
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: Text(
                        'Favorite Matches',
                        style: AppStyles.heading16(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return MatchResultRow(matchEntity: favMatches[index - 1]);
      },
    );
  }
}
