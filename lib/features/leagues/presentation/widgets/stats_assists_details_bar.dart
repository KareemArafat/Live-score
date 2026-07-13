import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class StatsAssistsDetailsBar extends StatelessWidget {
  const StatsAssistsDetailsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.h(12)),
      child: Row(
        children: [
          SizedBox(
            width: context.w(16),
            child: Text('#', style: AppStyles.grayBody12(context)),
          ),
          SizedBox(width: context.w(6)),
          Text('Name', style: AppStyles.grayBody12(context)),
          Spacer(),
          SizedBox(
            width: context.w(50),
            child: Center(
              child: Text('Assist', style: AppStyles.grayBody12(context)),
            ),
          ),
        ],
      ),
    );
  }
}
