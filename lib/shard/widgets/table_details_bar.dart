import 'package:flutter/cupertino.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class TableDetailsBar extends StatelessWidget {
  const TableDetailsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.w(12),
        right: context.w(12),
        bottom: context.h(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: context.w(16),
            child: Center(
              child: Text('#', style: AppStyles.grayBody12(context)),
            ),
          ),
          SizedBox(width: context.w(6)),
          Text('Team', style: AppStyles.grayBody12(context)),
          Spacer(),
          SizedBox(
            width: context.w(20),
            child: Center(
              child: Text('PL', style: AppStyles.grayBody12(context)),
            ),
          ),
          SizedBox(
            width: context.w(20),
            child: Center(
              child: Text('W', style: AppStyles.grayBody12(context)),
            ),
          ),
          SizedBox(
            width: context.w(20),
            child: Center(
              child: Text('D', style: AppStyles.grayBody12(context)),
            ),
          ),
          SizedBox(
            width: context.w(20),
            child: Center(
              child: Text('L', style: AppStyles.grayBody12(context)),
            ),
          ),
          SizedBox(
            width: context.w(40),
            child: Center(
              child: Text('+/-', style: AppStyles.grayBody12(context)),
            ),
          ),
          SizedBox(
            width: context.w(20),
            child: Center(
              child: Text('=', style: AppStyles.grayBody12(context)),
            ),
          ),
          SizedBox(
            width: context.w(30),
            child: Center(
              child: Text('Pts', style: AppStyles.grayBody12(context)),
            ),
          ),
        ],
      ),
    );
  }
}
