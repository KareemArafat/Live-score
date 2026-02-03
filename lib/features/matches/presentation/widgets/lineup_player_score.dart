import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class LineupPlayerScore extends StatelessWidget {
  const LineupPlayerScore({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text('2', style: AppStyles.body10.copyWith(color: Colors.black)),
          SizedBox(width: 1),
          Row(children: [Image.asset(image, height: 10)]),
        ],
      ),
    );
  }
}
