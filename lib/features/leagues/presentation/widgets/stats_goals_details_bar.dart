import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class StatsGoalsDetailsBar extends StatelessWidget {
  const StatsGoalsDetailsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(width: 15, child: Text('#', style: AppStyles.grayBody12(context))),
          SizedBox(width: 5),
          Text('Name', style: AppStyles.grayBody12(context)),
          Spacer(),
          SizedBox(
            width: 40,
            child: Center(child: Text('Goal', style: AppStyles.grayBody12(context))),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 50,
            child: Center(child: Text('Penalty', style: AppStyles.grayBody12(context))),
          ),
        ],
      ),
    );
  }
}
