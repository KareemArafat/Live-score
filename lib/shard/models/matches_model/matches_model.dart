import 'package:live_score_app/shard/models/matches_model/game.dart';
import 'package:live_score_app/shard/models/matches_model/paging.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';

class MatchesModel extends LeagueMatchesEntity {
  final Paging? paging;
  final List<Game>? games;

  MatchesModel({this.paging, this.games})
    : super(
        previousPage: paging?.previousPage,
        nextPage: paging?.nextPage,
        gamesList: games,
      );

  factory MatchesModel.fromJson(Map<String, dynamic> json) {
    return MatchesModel(
      paging: json['paging'] != null ? Paging.fromJson(json['paging']) : null,
      games: (json['games'] as List<dynamic>?)
          ?.map((e) => Game.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
