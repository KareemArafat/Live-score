import 'package:flutter/cupertino.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class TableDetailsBar extends StatelessWidget {
  const TableDetailsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 15,
            child: Center(child: Text('#', style: AppStyles.grayBody12(context))),
          ),
          SizedBox(width: 10),
          Text('Team', style: AppStyles.grayBody12(context)),
          Spacer(),
          SizedBox(width: 15, child: Text('PL', style: AppStyles.grayBody12(context))),
          SizedBox(width: 5),
          SizedBox(
            width: 15,
            child: Center(child: Text('W', style: AppStyles.grayBody12(context))),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 15,
            child: Center(child: Text('D', style: AppStyles.grayBody12(context))),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 15,
            child: Center(child: Text('L', style: AppStyles.grayBody12(context))),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 35,
            child: Center(child: Text('+/-', style: AppStyles.grayBody12(context))),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 20,
            child: Center(child: Text('=', style: AppStyles.grayBody12(context))),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 20,
            child: Center(child: Text('Pts', style: AppStyles.grayBody12(context))),
          ),
        ],
      ),
    );
  }
}
