import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.size,
    this.defaultImage,
  });
  final String imageUrl;
  final double size;
  final String? defaultImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: AspectRatio(
        aspectRatio: 2 / 1.5,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          errorWidget: (context, url, error) => SizedBox(),
        ),
      ),
    );
  }
}
