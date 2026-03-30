import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    required this.itemName,
    required this.itemImage,
    this.onTap,
  });
  final String itemName;
  final String itemImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.comfortable,
      title: Text(itemName, style: AppStyles.body14),
      leading: CustomNetworkImage(imageUrl: itemImage, size: 20),
      onTap: onTap,
    );
  }
}
