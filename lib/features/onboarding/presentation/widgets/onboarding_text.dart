import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_gradient_widget.dart';

class OnboardingText extends StatelessWidget {
  OnboardingText({super.key, required this.index, required this.isOut});
  final int index;
  final bool isOut;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSlide(
            offset: isOut ? Offset(-1.5, 0) : Offset.zero,
            duration: Duration(milliseconds: 300),
            child: Row(
              children: [
                Text(titles[index], style: AppStyles.heading20(context)),
                if (index == 0)
                  CustomGradientWidget(
                    child: Text(
                      'LiveScore',
                      style: AppStyles.heading22(context),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: context.h(12)),
          AnimatedSlide(
            offset: isOut ? Offset(1.5, 0) : Offset.zero,
            duration: Duration(milliseconds: 300),
            child: Text(descriptions[index], style: AppStyles.body14(context)),
          ),
        ],
      ),
    );
  }

  final List<String> titles = [
    'Welcome to ',
    'Get Real-Time Updates',
    'Follow Your Favorites',
  ];

  final List<String> descriptions = [
    'Enjoy the world of football with live scores, match updates, and the latest football news.',
    'Get real-time match statistics, player performance, and detailed game insights instantly.',
    'Stay connected with your favorite teams, leagues, and players all in one place.',
  ];
}
