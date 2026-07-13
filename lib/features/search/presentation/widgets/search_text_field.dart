import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.w(8)),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        style: AppStyles.body14(context),
        cursorColor: AppColors.baseColor1,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.04),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          hintText: 'Search',
          hintStyle: AppStyles.body14(context),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w(8)),
            child: Icon(
              Icons.search,
              size: context.sp(14),
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
        onTapOutside: (event) {
          controller.clear();
          focusNode.unfocus();
        },
      ),
    );
  }
}
