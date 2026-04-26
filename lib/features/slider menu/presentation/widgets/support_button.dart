import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  final String text;
  final String icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 0),
        elevation: 0,
        backgroundColor: Colors.white.withValues(alpha: 0.04),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon),
          SizedBox(width: 10),
          Text(
            '$text Support',
            style: AppStyles.body14(context).copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
