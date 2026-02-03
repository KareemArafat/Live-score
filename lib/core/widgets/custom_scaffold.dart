import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_images.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
  });
  final Widget body;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(child: body),
      ),
    );
  }
}
