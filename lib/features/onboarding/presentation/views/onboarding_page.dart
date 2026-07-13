import 'dart:async';
import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/features/onboarding/presentation/views/onboarding_content_view.dart';
import 'package:live_score_app/features/onboarding/presentation/views/onboarding_images_view.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  int currentPage = 0;
  bool isOut = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() => isOut = true);
              Timer(
                Duration(milliseconds: 300),
                () => setState(() {
                  currentPage = value;
                  isOut = false;
                }),
              );
            },
            children: [
              OnboardingImagesView(image: AppImages.onBoarding1),
              OnboardingImagesView(image: AppImages.onBoarding2),
              OnboardingImagesView(image: AppImages.onBoarding3),
            ],
          ),
          OnboardingContentView(
            currentPage: currentPage,
            isOut: isOut,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
