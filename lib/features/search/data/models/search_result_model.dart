import 'package:live_score_app/shard/models/league_model.dart';
import 'package:live_score_app/features/search/data/models/search_athlete.dart';

import 'package:live_score_app/features/search/domain/entities/search_result_entity.dart';
import 'package:live_score_app/shard/models/team_model.dart';

class SearchResultModel extends SearchResultEntity {
  const SearchResultModel({
    required this.competitions,
    required this.competitors,
    required this.athletes,
  }) : super(
         leagueEntity: competitions,
         teamEntity: competitors,
         playerEntity: athletes,
       );
  final List<LeagueModel> competitions;
  final List<TeamModel> competitors;
  final List<SearchAthlete> athletes;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      competitions: json["competitions"] == null
          ? []
          : List<LeagueModel>.from(
              json["competitions"]!.map((x) => LeagueModel.fromJson(x)),
            ),
      competitors: json["competitors"] == null
          ? []
          : List<TeamModel>.from(
              json["competitors"]!.map((x) => TeamModel.fromJson(x)),
            ),
      athletes: json["athletes"] == null
          ? []
          : List<SearchAthlete>.from(
              json["athletes"]!.map((x) => SearchAthlete.fromJson(x)),
            ),
    );
  }
}
