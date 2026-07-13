import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/widgets/custom_animated_button.dart';
import 'package:live_score_app/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:live_score_app/features/onboarding/presentation/widgets/onboarding_text.dart';

class OnboardingContentView extends StatelessWidget {
  const OnboardingContentView({
    super.key,
    required this.currentPage,
    required this.isOut,
    required this.controller,
  });
  final int currentPage;
  final bool isOut;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    void goToCreateUser() {
      GoRouter.of(context).pushReplacement(AppRouters.createUserPage);
    }

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.h(20),
          horizontal: context.w(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OnboardingText(index: currentPage, isOut: isOut),
            SizedBox(height: context.h(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnboardingIndicator(isActive: currentPage == 0),
                OnboardingIndicator(isActive: currentPage == 1),
                OnboardingIndicator(isActive: currentPage == 2),
              ],
            ),
            SizedBox(height: context.h(30)),
            currentPage == 2
                ? CustomAnimatedButton(
                    widget: Text(
                      'Get Started',
                      style: AppStyles.body14(context).copyWith(height: 1),
                    ),
                    onTap: () => goToCreateUser(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAnimatedButton(
                        widget: Text(
                          'Skip',
                          style: AppStyles.body14(context).copyWith(height: 1),
                        ),
                        onTap: () => goToCreateUser(),
                      ),
                      CustomAnimatedButton(
                        widget: Icon(
                          Icons.navigate_next_outlined,
                          size: context.sp(14),
                        ),
                        onTap: () => controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
