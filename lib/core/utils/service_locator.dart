import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:live_score_app/core/api/api_service.dart';
import 'package:live_score_app/features/day matches/data/data_source/day_matches_remote_data_source.dart';
import 'package:live_score_app/features/day matches/data/repos/day_matches_repo_impl.dart';
import 'package:live_score_app/features/day matches/domain/repos/day_matches_repo.dart';
import 'package:live_score_app/features/day matches/domain/use_cases/get_all_matches_use_case.dart';
import 'package:live_score_app/features/day matches/domain/use_cases/get_fav_matches_use_case.dart';
import 'package:live_score_app/features/fav teams/data/data_source/fav_teams_local_data_source.dart';
import 'package:live_score_app/features/fav teams/data/repos/fav_teams_repo_impl.dart';
import 'package:live_score_app/features/fav teams/domain/repos/fav_teams_repo.dart';
import 'package:live_score_app/features/leagues/data/data_sources/leagues_remote_data_source.dart';
import 'package:live_score_app/features/leagues/data/repos/leagues_repo_impl.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_all_leagues_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_matches_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_news_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_players_stats_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_table_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_more_league_matches_use_case.dart';
import 'package:live_score_app/features/matches/data/data_source/match_details_remote_data_source.dart';
import 'package:live_score_app/features/matches/data/repos/match_details_repo_impl.dart';
import 'package:live_score_app/features/matches/domain/repos/match_details_repo.dart';
import 'package:live_score_app/features/matches/domain/use_cases/get_match_details_use_case.dart';
import 'package:live_score_app/features/matches/domain/use_cases/get_match_stats_use_case.dart';
import 'package:live_score_app/features/profile/data/data source/profile_local_data_source.dart';
import 'package:live_score_app/features/profile/data/repos/profile_repo_imp.dart';
import 'package:live_score_app/features/profile/domain/repos/profile_repo.dart';
import 'package:live_score_app/features/profile/domain/use cases/create_user_use_case.dart';
import 'package:live_score_app/features/search/data/data sources/search_remote_data_source.dart';
import 'package:live_score_app/features/search/data/repos/search_repo_impl.dart';
import 'package:live_score_app/features/search/domain/repos/search_repo.dart';
import 'package:live_score_app/features/search/domain/use_cases/search_use_case.dart';
import 'package:live_score_app/features/teams/data/data_sources/team_remote_data_source.dart';
import 'package:live_score_app/features/teams/data/repos/team_repo_impl.dart';
import 'package:live_score_app/features/teams/domain/repos/team_repo.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_more_team_matches_use_case.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_matches_use_case.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_news_use_case.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_squad_use_case.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_standing_use_case.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  /// 🔹 Core
  getIt.registerLazySingleton(() => ApiServices(Dio()));

  /// 🔹 Repos
  getIt.registerLazySingleton<DayMatchesRepo>(
    () => DayMatchesRepoImpl(DayMatchesRemoteDataSourceImpl(getIt())),
  );
  getIt.registerLazySingleton<LeaguesRepo>(
    () => LeaguesRepoImpl(LeaguesRemoteDataSourceImpl(getIt())),
  );
  getIt.registerLazySingleton<TeamRepo>(
    () => TeamRepoImpl(TeamRemoteDataSourceImpl(getIt())),
  );
  getIt.registerLazySingleton<MatchDetailsRepo>(
    () => MatchDetailsRepoImpl(MatchDetailsRemoteDataSourceImpl(getIt())),
  );
  getIt.registerLazySingleton<FavTeamsRepo>(
    () => FavTeamsRepoImpl(FavTeamsLocalDataSourceImpl()),
  );
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(SearchRemoteDataSourceImpl(getIt())),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImp(ProfileLocalDataSourceImp()),
  );

  /// 🔹 Leagues UseCases
  getIt.registerLazySingleton(() => GetAllLeaguesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetLeagueTableUseCase(getIt()));
  getIt.registerLazySingleton(() => GetLeagueMatchesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMoreLeagueMatchesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetLeaguePlayersStatsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetLeagueNewsUseCase(getIt()));

  /// 🔹 Teams UseCases
  getIt.registerLazySingleton(() => GetTeamSquadUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTeamMatchesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMoreTeamMatchesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTeamStandingUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTeamNewsUseCase(getIt()));

  /// 🔹 Matches UseCases
  getIt.registerLazySingleton(() => GetMatchDetailsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMatchStatsUseCase(getIt()));

  /// 🔹 Day Matches UseCases
  getIt.registerLazySingleton(() => GetAllMatchesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetFavMatchesUseCase(getIt()));

  /// 🔹 Search
  getIt.registerLazySingleton(() => SearchUseCase(getIt()));

  /// 🔹 Profile
  getIt.registerLazySingleton(() => CreateUserUseCase(getIt()));
}
