import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
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
  final TableRowEntity teamRow;
  final Color textColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRouters.teamPage, extra: teamRow.team),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.h(8),
          horizontal: context.w(12),
        ),
        color: isSelected
            ? AppColors.grayColor.withAlpha(100)
            : Colors.transparent,
        child: Row(
          children: [
            SizedBox(
              width: context.w(16),
              child: Center(
                child: Text(
                  teamRow.teamRank.toString(),
                  style: AppStyles.body10(context).copyWith(color: textColor),
                ),
              ),
            ),
            SizedBox(width: context.w(6)),
            CustomNetworkImage(
              imageUrl: teamRow.team.teamImage,
              size: context.rMin(12),
            ),
            SizedBox(width: context.w(6)),
            Text(
              teamRow.team.teamName,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.body10(context).copyWith(color: textColor),
            ),
            Spacer(),
            SizedBox(
              width: context.w(20),
              child: Center(
                child: Text(
                  teamRow.matchesNum.toString(),
                  style: AppStyles.body10(context).copyWith(color: textColor),
                ),
              ),
            ),
            SizedBox(
              width: context.w(20),
              child: Center(
                child: Text(
                  teamRow.wins.toString(),
                  style: AppStyles.body10(
                    context,
                  ).copyWith(color: Colors.green),
                ),
              ),
            ),
            SizedBox(
              width: context.w(20),
              child: Center(
                child: Text(
                  teamRow.draws.toString(),
                  style: AppStyles.body10(
                    context,
                  ).copyWith(color: Colors.yellow),
                ),
              ),
            ),
            SizedBox(
              width: context.w(20),
              child: Center(
                child: Text(
                  teamRow.loses.toString(),
                  style: AppStyles.body10(context).copyWith(color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              width: context.w(40),
              child: Center(
                child: Text(
                  '${teamRow.scored}/${teamRow.accepted}',
                  style: AppStyles.body10(context).copyWith(color: textColor),
                ),
              ),
            ),
            SizedBox(
              width: context.w(20),
              child: Center(
                child: Text(
                  teamRow.diff.toString(),
                  style: AppStyles.body10(context).copyWith(color: textColor),
                ),
              ),
            ),
            SizedBox(
              width: context.w(30),
              child: Center(
                child: Text(
                  teamRow.totalPoints.toString(),
                  style: AppStyles.body10(
                    context,
                  ).copyWith(color: textColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
