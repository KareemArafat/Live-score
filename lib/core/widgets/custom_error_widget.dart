import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMess,
    this.onPressed,
    this.textColor,
  });
  final String errorMess;
  final void Function()? onPressed;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              textAlign: TextAlign.center,
              errorMess,
              style: AppStyles.body14(context).copyWith(color: textColor),
            ),
          ),
          IconButton(
            disabledColor: AppColors.secColor2,
            onPressed: onPressed,
            icon: Icon(Icons.refresh),
            iconSize: context.r(35),
            color: AppColors.secColor2,
          ),
        ],
      ),
    );
  }
}
