import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_images.dart';

class PlayerImage extends StatelessWidget {
  const PlayerImage({
    super.key,
    required this.image,
    this.radius = 15,
    this.isCoach = false,
  });
  final String image;
  final int radius;
  final bool isCoach;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius.toDouble(),
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(isCoach ? AppImages.coach : AppImages.player),
      foregroundImage: CachedNetworkImageProvider(image),
      onForegroundImageError: (exception, stackTrace) =>
          AssetImage(isCoach ? AppImages.coach : AppImages.player),
      onBackgroundImageError: (exception, stackTrace) =>
          AssetImage(isCoach ? AppImages.coach : AppImages.player),
    );
  }
}
