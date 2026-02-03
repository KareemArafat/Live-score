import 'package:live_score_app/shard/entities/match_entity.dart';

class LeagueMatchesEntity {
  final String? previousPage;
  final String? nextPage;
  final List<MatchEntity>? gamesList;

  const LeagueMatchesEntity({
    required this.previousPage,
    required this.nextPage,
    required this.gamesList,
  });
}
