import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/enums.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:provider/provider.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({super.key, required this.event});
  final EventsEntity event;

  @override
  Widget build(BuildContext context) {
    final int homeTeamId = context.read<MatchEntity>().homeTeamId;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          homeTeamId == event.teamId ? _homeTeamEvent(context: context) : _awayTeamEvent(context: context),
          Container(
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.blueGradient,
            ),
            child: Center(
              child: Text("${event.time}'", style: AppStyles.body10(context)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeTeamEvent({required BuildContext context}) {
    return Row(
      children: [
        Image.asset(_eventImage(), height: 18),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.playerName, style: AppStyles.body12(context)),
            if (_eventSubTitle() != null)
              Text(_eventSubTitle()!, style: AppStyles.grayBody10(context)),
          ],
        ),
      ],
    );
  }

  Widget _awayTeamEvent({required BuildContext context}) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Transform.flip(
          flipX: true,
          child: Image.asset(_eventImage(), height: 18),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(event.playerName, style: AppStyles.body12(context)),
            if (_eventSubTitle() != null)
              Text(_eventSubTitle()!, style: AppStyles.grayBody10(context)),
          ],
        ),
      ],
    );
  }

  String _eventImage() {
    if (event.eventName == MatchEventsEnum.goal.value) {
      return AppImages.goal;
    } else if (event.eventName == MatchEventsEnum.redCard.value) {
      return AppImages.redCard;
    } else if (event.eventName == MatchEventsEnum.yellowCard.value) {
      return AppImages.yellowCard;
    } else if (event.eventName == MatchEventsEnum.subst.value) {
      return AppImages.substitution;
    } else if (event.eventName == MatchEventsEnum.woodWork.value) {
      return AppImages.crossbar;
    } else if (event.eventName == MatchEventsEnum.penaltyMiss.value) {
      return AppImages.penaltyMiss;
    } else if (event.eventName == MatchEventsEnum.varEvent.value) {
      return AppImages.varVideo;
    } else {
      return AppImages.assist;
    }
  }

  String? _eventSubTitle() {
    if (event.eventName == MatchEventsEnum.goal.value &&
        event.extraPlayerId != null) {
      return 'Assist: ${event.extraPlayerName!}';
    } else if (event.eventName == MatchEventsEnum.subst.value) {
      return 'In: ${event.extraPlayerName!}';
    } else if (event.eventDetails == 'Field Goal') {
      return null;
    } else {
      return event.eventName;
    }
  }
}
