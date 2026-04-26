import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/presentation/widgets/events_item.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key, required this.events});
  final List<EventsEntity> events;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: events.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _eventsTitle('Match Events', context);
        }
        final item = events[index - 1];
        return EventsItem(event: item);
      },
    );
  }

  Widget _eventsTitle(String text,BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          gradient: AppColors.blueGradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: AppStyles.body10(context)),
      ),
    );
  }
}
