import 'package:flutter/material.dart';
import 'package:live_score_app/core/widgets/custom_search_field.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () async {}, icon: Icon(Icons.menu, size: 25)),
        SizedBox(width: 10),
        CustomSearchField(),
      ],
    );
  }
}
