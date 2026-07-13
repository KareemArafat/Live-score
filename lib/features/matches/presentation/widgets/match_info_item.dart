import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';

class MatchInfoItem extends StatelessWidget {
  const MatchInfoItem({
    super.key,
    required this.image,
    required this.infoText,
    this.isLeague = false,
  });

  final String image;
  final String infoText;
  final bool isLeague;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(50),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          SizedBox(
            width: context.w(12),
            child: isLeague
                ? CustomNetworkImage(imageUrl: image, size: context.w(12))
                : Image.asset(image, width: context.w(12), fit: BoxFit.cover),
          ),
          SizedBox(width: 15),
          Flexible(child: Text(infoText, style: AppStyles.body12(context))),
        ],
      ),
    );
  }
}
