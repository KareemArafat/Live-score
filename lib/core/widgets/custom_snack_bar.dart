import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

void customSnackBar(BuildContext context, String errMess) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Text(errMess, style: AppStyles.body14),
    ),
  );
}
