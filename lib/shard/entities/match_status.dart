import 'package:live_score_app/core/utils/enums.dart';

class MatchStatus {
  String? text;
  bool? circleActive;

  MatchStatus({this.text, this.circleActive});

  void getMatchStatus(String status, int? minutes, String? scheduledTime) {
    final matchStatus = MatchStatusEnum.values.firstWhere(
      (e) => e.value == status,
    );

    switch (matchStatus) {
      case MatchStatusEnum.scheduled:
        text = scheduledTime;
        circleActive = false;
        break;

      case MatchStatusEnum.firstHalf:
      case MatchStatusEnum.secondHalf:
        text = '$minutes\'';
        circleActive = true;
        break;

      case MatchStatusEnum.halfTime:
        text = 'HT';
        circleActive = true;
        break;

      case MatchStatusEnum.justEnded:
      case MatchStatusEnum.ended:
        text = 'FT';
        circleActive = true;
        break;

      case MatchStatusEnum.afterET:
        text = 'AET';
        circleActive = true;
        break;

      case MatchStatusEnum.afterPenalties:
        text = 'PEN';
        circleActive = true;
        break;

      case MatchStatusEnum.canceled:
      case MatchStatusEnum.postponed:
      case MatchStatusEnum.fro:
      case MatchStatusEnum.abandoned:
      case MatchStatusEnum.suspend:
      case MatchStatusEnum.awarded:
        text = matchStatus.value;
        circleActive = false;
        break;
    }
  }
}
