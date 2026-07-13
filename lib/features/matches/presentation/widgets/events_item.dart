import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/enums.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:provider/provider.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({super.key, required this.eventEntity});
  final EventEntity eventEntity;

  @override
  Widget build(BuildContext context) {
    final int homeTeamId = context.read<MatchEntity>().homeTeam.teamId;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          homeTeamId == eventEntity.teamId
              ? _homeTeamEvent(context: context)
              : _awayTeamEvent(context: context),
          Container(
            padding: EdgeInsets.all(context.rMin(6)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.blueGradient,
            ),
            child: Center(
              child: Text(
                "${eventEntity.time}'",
                style: AppStyles.body8(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeTeamEvent({required BuildContext context}) {
    return Row(
      children: [
        Image.asset(_eventImage(), height: context.rMin(18)),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(eventEntity.playerName, style: AppStyles.body12(context)),
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
          child: Image.asset(_eventImage(), height: context.rMin(18)),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(eventEntity.playerName, style: AppStyles.body12(context)),
            if (_eventSubTitle() != null)
              Text(_eventSubTitle()!, style: AppStyles.grayBody10(context)),
          ],
        ),
      ],
    );
  }

  String _eventImage() {
    if (eventEntity.eventName == MatchEventsEnum.goal.value) {
      return AppImages.goal;
    } else if (eventEntity.eventName == MatchEventsEnum.redCard.value) {
      return AppImages.redCard;
    } else if (eventEntity.eventName == MatchEventsEnum.yellowCard.value) {
      return AppImages.yellowCard;
    } else if (eventEntity.eventName == MatchEventsEnum.subst.value) {
      return AppImages.substitution;
    } else if (eventEntity.eventName == MatchEventsEnum.woodWork.value) {
      return AppImages.crossbar;
    } else if (eventEntity.eventName == MatchEventsEnum.penaltyMiss.value) {
      return AppImages.penaltyMiss;
    } else if (eventEntity.eventName == MatchEventsEnum.varEvent.value) {
      return AppImages.varVideo;
    } else {
      return AppImages.assist;
    }
  }

  String? _eventSubTitle() {
    if (eventEntity.eventName == MatchEventsEnum.goal.value &&
        eventEntity.extraPlayerId != null) {
      return 'Assist: ${eventEntity.extraPlayerName}';
    } else if (eventEntity.eventName == MatchEventsEnum.subst.value) {
      return eventEntity.extraPlayerName;
    } else if (eventEntity.eventDetails == 'Field Goal' ||
        eventEntity.eventName == 'Goal') {
      return null;
    } else {
      return eventEntity.eventName;
    }
  }
}
