import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class SliderMenuItem extends StatelessWidget {
  const SliderMenuItem({
    super.key,
    required this.iconData,
    required this.tittle,
    this.onTap,
  });
  final IconData iconData;
  final String tittle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: Colors.white),
      title: Text(tittle, style: AppStyles.body14),
      onTap: onTap,
    );
  }
}
