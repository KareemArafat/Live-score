import 'package:flutter/material.dart';
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
    return Container(
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
          hintText: 'Search',
          hintStyle: AppStyles.body14,
          prefixIcon: Icon(Icons.search, size: 18, color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
