import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';

class LineupPlayerScore extends StatelessWidget {
  const LineupPlayerScore({
    super.key,
    required this.image,
    required this.num,
    required this.isLeft,
  });
  final String image;
  final int num;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    final imageSize = context.rMin(15);
    final overlap = context.rMin(6);
    return SizedBox(
      width: imageSize + ((num - 1) * overlap),
      height: imageSize,
      child: Stack(
        children: List.generate(
          num,
          (index) => Positioned(
            left: isLeft ? index * overlap : null,
            right: isLeft ? null : index * overlap,
            child: Container(
              padding: EdgeInsets.all(context.rMin(2)),
              height: imageSize,
              width: imageSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }
}
