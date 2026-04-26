import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
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
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          focusNode: focusNode,
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            hintText: 'Search',
            hintStyle: AppStyles.body14(context),
            prefixIcon: Icon(
              Icons.search,
              size: context.sp(18),
              color: Colors.white,
            ),
            border: InputBorder.none,
          ),
          onTapOutside: (event) {
            controller.clear();
            focusNode.unfocus();
          },
        ),
      ),
    );
  }
}
