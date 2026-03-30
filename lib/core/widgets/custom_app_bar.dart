import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/features/search/presentation/widgets/search_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        SizedBox(width: 10),
        Expanded(child: SearchField()),
      ],
    );
  }
}
