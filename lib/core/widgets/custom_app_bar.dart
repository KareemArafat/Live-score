import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/features/search/presentation/widgets/search_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.isHome = false});
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                isHome ? Icons.menu : Icons.arrow_back,
                color: Colors.white,
                size: context.sp(20),
              ),
              onPressed: () => isHome
                  ? Scaffold.of(context).openDrawer()
                  : GoRouter.of(context).pop(),
            ),
          ),
          Expanded(child: SearchField()),
        ],
      ),
    );
  }
}
