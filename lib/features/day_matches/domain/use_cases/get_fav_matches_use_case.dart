import 'package:live_score_app/features/day_matches/domain/repos/day_matches_repo.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';

class GetFavMatchesUseCase {
  final DayMatchesRepo _dayMatchesRepo;

  GetFavMatchesUseCase(this._dayMatchesRepo);

  List<MatchEntity> execute({required List<MatchEntity> allMatches}) {
    return _dayMatchesRepo.getFavMatches(allMatches: allMatches);
  }
}
