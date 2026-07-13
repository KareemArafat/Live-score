import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/shard/models/match_model.dart';
import 'package:live_score_app/shard/models/matches_list_model/paging.dart';

class MatchesListModel extends LeagueMatchesEntity {
  final Paging? paging;
  final List<MatchModel>? games;

  MatchesListModel({this.paging, this.games})
    : super(
        previousPage: paging?.previousPage,
        nextPage: paging?.nextPage,
        gamesList: games ?? [],
      );

  factory MatchesListModel.fromJson(Map<String, dynamic> json) {
    return MatchesListModel(
      paging: json['paging'] != null ? Paging.fromJson(json['paging']) : null,
      games: (json['games'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
