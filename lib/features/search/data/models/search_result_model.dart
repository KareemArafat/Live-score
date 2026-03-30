import 'package:live_score_app/features/search/data/models/search_athlete.dart';
import 'package:live_score_app/features/search/data/models/search_competition.dart';
import 'package:live_score_app/features/search/data/models/search_competitor.dart';
import 'package:live_score_app/features/search/domain/entities/search_result_entity.dart';

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
  final List<SearchCompetition> competitions;
  final List<SearchCompetitor> competitors;
  final List<SearchAthlete> athletes;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      competitions: json["competitions"] == null
          ? []
          : List<SearchCompetition>.from(
              json["competitions"]!.map((x) => SearchCompetition.fromJson(x)),
            ),
      competitors: json["competitors"] == null
          ? []
          : List<SearchCompetitor>.from(
              json["competitors"]!.map((x) => SearchCompetitor.fromJson(x)),
            ),
      athletes: json["athletes"] == null
          ? []
          : List<SearchAthlete>.from(
              json["athletes"]!.map((x) => SearchAthlete.fromJson(x)),
            ),
    );
  }
}
