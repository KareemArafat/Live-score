import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';

class TableItem extends StatelessWidget {
  const TableItem({
    super.key,
    required this.teamRow,
    this.textColor = Colors.white,
    this.isSelected = false,
  });
  final RowEntity teamRow;
  final Color textColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRouters.teamPage, extra: teamRow.team),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        color: isSelected
            ? AppColors.grayColor.withAlpha(100)
            : Colors.transparent,
        child: Row(
          children: [
            SizedBox(
              width: 15,
              child: Center(
                child: Text(
                  teamRow.teamRank.toString(),
                  style: AppStyles.body10(context).copyWith(color: textColor),
                ),
              ),
            ),
            SizedBox(width: 10),
            CustomNetworkImage(imageUrl: teamRow.team!.teamImage, size: 15),
            SizedBox(width: 5),
            SizedBox(
              width: 100,
              child: Text(
                teamRow.team!.teamName.length > 20
                    ? "${teamRow.team!.teamName.substring(0, 15)}..."
                    : teamRow.team!.teamName,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.body10(context).copyWith(color: textColor),
              ),
            ),
            Spacer(),
            SizedBox(
              width: 15,
              child: Center(
                child: Text(
                  teamRow.matchesNum.toString(),
                  style: AppStyles.body10(context).copyWith(color: textColor),
                ),
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              width: 15,
              child: Center(
                child: Text(
                  teamRow.wins.toString(),
                  style: AppStyles.body10(context).copyWith(color: Colors.green),
                ),
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              width: 15,
              child: Center(
                child: Text(
                  teamRow.draws.toString(),
                  style: AppStyles.body10(context).copyWith(color: Colors.yellow),
                ),
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              width: 15,
              child: Center(
                child: Text(
                  teamRow.loses.toString(),
                  style: AppStyles.body10(context).copyWith(color: Colors.red),
                ),
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              width: 35,
              child: Center(
                child: Text(
                  ' ${teamRow.scored.toString()}/${teamRow.accepted.toString()} ',
                  style: AppStyles.body10(context).copyWith(color: textColor),
                ),
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  teamRow.diff.toString(),
                  style: AppStyles.body10(context).copyWith(color: textColor),
                ),
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  teamRow.totalPoints.toString(),
                  style: AppStyles.body10(context).copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
