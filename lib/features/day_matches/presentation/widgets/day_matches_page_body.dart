import 'package:flutter/material.dart';
import 'package:live_score_app/core/widgets/custom_app_bar.dart';
import 'package:live_score_app/features/day_matches/presentation/widgets/date_section.dart';
import 'package:live_score_app/features/day_matches/presentation/widgets/day_matches_list.dart';

class DayMatchesPageBody extends StatefulWidget {
  const DayMatchesPageBody({super.key});

  @override
  State<DayMatchesPageBody> createState() => _DayMatchesPageBodyState();
}

class _DayMatchesPageBodyState extends State<DayMatchesPageBody> {
  final ScrollController controller = ScrollController();
  bool hideTopBar = false;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > 20 && !hideTopBar) {
        setState(() => hideTopBar = true);
      } else if (controller.offset <= 20 && hideTopBar) {
        setState(() => hideTopBar = false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSize(
          duration: Duration(milliseconds: 100),
          child: hideTopBar ? SizedBox.shrink() : CustomAppBar(isHome: true),
        ),
        DateSection(),
        Expanded(child: DayMatchesList(controller: controller)),
      ],
    );
  }
}
