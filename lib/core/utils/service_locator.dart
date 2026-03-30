import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:live_score_app/core/api/api_service.dart';
import 'package:live_score_app/features/day%20matches/data/data_source/day_matches_remote_data_source.dart';
import 'package:live_score_app/features/day%20matches/data/repos/day_matches_repo_impl.dart';
import 'package:live_score_app/features/day%20matches/domain/repos/day_matches_repo.dart';
import 'package:live_score_app/features/day%20matches/domain/use_cases/get_all_matches_use_case.dart';
import 'package:live_score_app/features/day%20matches/domain/use_cases/get_fav_matches_use_case.dart';
import 'package:live_score_app/features/fav%20teams/data/data_source/fav_teams_local_data_source.dart';
import 'package:live_score_app/features/fav%20teams/data/repos/fav_teams_repo_impl.dart';
import 'package:live_score_app/features/fav%20teams/domain/repos/fav_teams_repo.dart';
import 'package:live_score_app/features/leagues/data/data_sources/leagues_remote_data_source.dart';
import 'package:live_score_app/features/leagues/data/repos/leagues_repo_impl.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_matches_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_news_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_table_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_all_leagues_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_players_stats_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_more_league_matches_use_case.dart';
import 'package:live_score_app/features/matches/data/data_source/match_details_remote_data_source.dart';
import 'package:live_score_app/features/matches/data/repos/match_details_repo_impl.dart';
import 'package:live_score_app/features/matches/domain/repos/match_details_repo.dart';
import 'package:live_score_app/features/matches/domain/use_cases/get_match_details_use_case.dart';
import 'package:live_score_app/features/matches/domain/use_cases/get_match_stats_use_case.dart';
import 'package:live_score_app/features/profile/data/data%20source/profile_local_data_source.dart';
import 'package:live_score_app/features/profile/data/repos/profile_repo_imp.dart';
import 'package:live_score_app/features/profile/domain/repos/profile_repo.dart';
import 'package:live_score_app/features/profile/domain/use%20cases/create_user_use_case.dart';
import 'package:live_score_app/features/search/data/data%20sources/search_remote_data_source.dart';
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
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));

  // repos
  getIt.registerSingleton<DayMatchesRepo>(
    DayMatchesRepoImpl(DayMatchesRemoteDataSourceImpl(getIt<ApiServices>())),
  );
  getIt.registerSingleton<LeaguesRepo>(
    LeaguesRepoImpl(LeaguesRemoteDataSourceImpl(getIt<ApiServices>())),
  );
  getIt.registerSingleton<TeamRepo>(
    TeamRepoImpl(TeamRemoteDataSourceImpl(getIt<ApiServices>())),
  );
  getIt.registerSingleton<MatchDetailsRepo>(
    MatchDetailsRepoImpl(
      MatchDetailsRemoteDataSourceImpl(getIt<ApiServices>()),
    ),
  );
  getIt.registerSingleton<FavTeamsRepo>(
    FavTeamsRepoImpl(FavTeamsLocalDataSourceImpl()),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(SearchRemoteDataSourceImpl(getIt<ApiServices>())),
  );
  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImp(ProfileLocalDataSourceImp()),
  );

  // league use cases
  getIt.registerSingleton<GetAllLeaguesUseCase>(
    GetAllLeaguesUseCase(getIt<LeaguesRepo>()),
  );
  getIt.registerSingleton<GetLeagueTableUseCase>(
    GetLeagueTableUseCase(getIt<LeaguesRepo>()),
  );
  getIt.registerSingleton<GetLeagueMatchesUseCase>(
    GetLeagueMatchesUseCase(getIt<LeaguesRepo>()),
  );
  getIt.registerSingleton<GetMoreLeagueMatchesUseCase>(
    GetMoreLeagueMatchesUseCase(getIt<LeaguesRepo>()),
  );
  getIt.registerSingleton<GetLeaguePlayersStatsUseCase>(
    GetLeaguePlayersStatsUseCase(getIt<LeaguesRepo>()),
  );
  getIt.registerSingleton<GetLeagueNewsUseCase>(
    GetLeagueNewsUseCase(getIt<LeaguesRepo>()),
  );

  // team use cases
  getIt.registerSingleton<GetTeamSquadUseCase>(
    GetTeamSquadUseCase(getIt<TeamRepo>()),
  );
  getIt.registerSingleton<GetTeamMatchesUseCase>(
    GetTeamMatchesUseCase(getIt<TeamRepo>()),
  );
  getIt.registerSingleton<GetMoreTeamMatchesUseCase>(
    GetMoreTeamMatchesUseCase(getIt<TeamRepo>()),
  );
  getIt.registerSingleton<GetTeamStandingUseCase>(
    GetTeamStandingUseCase(getIt<TeamRepo>()),
  );
  getIt.registerSingleton<GetTeamNewsUseCase>(
    GetTeamNewsUseCase(getIt<TeamRepo>()),
  );

  // match use cases
  getIt.registerSingleton<GetMatchDetailsUseCase>(
    GetMatchDetailsUseCase(getIt<MatchDetailsRepo>()),
  );
  getIt.registerSingleton<GetMatchStatsUseCase>(
    GetMatchStatsUseCase(getIt<MatchDetailsRepo>()),
  );

  //day matches use cases
  getIt.registerSingleton<GetAllMatchesUseCase>(
    GetAllMatchesUseCase(getIt<DayMatchesRepo>()),
  );
  getIt.registerSingleton<GetFavMatchesUseCase>(
    GetFavMatchesUseCase(getIt<DayMatchesRepo>()),
  );

  // search use cases
  getIt.registerSingleton<SearchUseCase>(SearchUseCase(getIt<SearchRepo>()));

  // profile use case
  getIt.registerSingleton<CreateUserUseCase>(
    CreateUserUseCase(getIt<ProfileRepo>()),
  );
}
