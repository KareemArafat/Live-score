import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 44),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, size: 18, color: Colors.white),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
