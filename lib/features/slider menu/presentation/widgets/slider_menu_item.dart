import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
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
      leading: Icon(iconData, color: Colors.white, size: context.r(20)),
      title: Text(tittle, style: AppStyles.body14(context)),
      onTap: onTap,
    );
  }
}
