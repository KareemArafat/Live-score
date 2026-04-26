import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class LineupPlayerScore extends StatelessWidget {
  const LineupPlayerScore({super.key, required this.image, required this.num});
  final String image;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: num > 1 ? 3 : 2,
        vertical: num > 1 ? 0 : 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (num > 1)
            Text(
              num.toString(),
              style: AppStyles.body10(context).copyWith(color: Colors.black),
            ),
          if (num > 1) SizedBox(width: 2),
          Row(children: [Image.asset(image, height: 10)]),
        ],
      ),
    );
  }
}
