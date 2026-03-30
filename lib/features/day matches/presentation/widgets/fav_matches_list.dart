import 'package:flutter/material.dart';
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
      padding: EdgeInsets.only(bottom: 25),
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
              widget: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Row(
                  children: [
                    CustomGradientWidget(
                      widget: Icon(Icons.star_rate_rounded, size: 35),
                      linearGradient: AppColors.blueGradient,
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: Text(
                        'Favorite Matches',
                        style: AppStyles.heading16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return MatchResultRow(match: favMatches[index - 1]);
      },
    );
  }
}
