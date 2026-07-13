import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      clipBehavior: Clip.antiAlias,
      child: ClipOval(
        child: Transform.translate(
          offset: Offset(0, context.rMin(8)),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
