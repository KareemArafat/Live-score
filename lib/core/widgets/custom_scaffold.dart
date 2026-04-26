import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_images.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
    this.drawer,
  });
  final Widget body;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: bottomNavigationBar,
        appBar: appBar,
        drawer: drawer,
        body: SafeArea(child: body),
      ),
    );
  }
}
