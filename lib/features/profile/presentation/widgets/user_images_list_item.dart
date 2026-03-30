import 'package:flutter/material.dart';

class UserImagesListItem extends StatelessWidget {
  const UserImagesListItem({
    super.key,
    required this.image,
    required this.size,
  });
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(image),
              alignment: Alignment(0, 0.3),
            ),
          ),
        );
      },
    );
  }
}
