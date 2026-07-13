import 'package:live_score_app/shard/entities/match_entity.dart';

class LeagueMatchesEntity {
  String? previousPage;
  String? nextPage;
  List<MatchEntity> gamesList;

  LeagueMatchesEntity({
    required this.previousPage,
    required this.nextPage,
    required this.gamesList,
  });
}
