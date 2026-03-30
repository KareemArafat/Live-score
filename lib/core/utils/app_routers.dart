import 'package:go_router/go_router.dart';
import 'package:live_score_app/features/profile/presentation/views/create_user_page.dart';
import 'package:live_score_app/features/slider%20menu/presentation/views/contact_us_page.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';
import 'package:live_score_app/shard/widgets/page_navigation_bar.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/features/day%20matches/presentation/views/day_matches_page.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/features/leagues/presentation/views/all_leagues_page.dart';
import 'package:live_score_app/features/matches/presentation/views/match_page.dart';
import 'package:live_score_app/features/teams/presentation/views/team_page.dart';

abstract class AppRouters {
  static const createUserPage = '/createUserPage';
  static const homePage = '/homePage';
  static const dayMatchesPage = '/dayMatchesPage';
  static const leaguesPage = '/leaguesPage';
  static const leagueDetailsPage = '/leagueDetailsPage';
  static const matchPage = '/matchPage';
  static const teamPage = '/teamPage';
  static const contactUsPage = '/contactUsPage';

  static GoRouter router(bool isSeen) => GoRouter(
    initialLocation: isSeen ? homePage : createUserPage,
    routes: <RouteBase>[
      GoRoute(
        path: createUserPage,
        builder: (context, state) => CreateUserPage(),
      ),
      GoRoute(path: homePage, builder: (context, state) => PageNavigationBar()),
      GoRoute(
        path: dayMatchesPage,
        builder: (context, state) => DayMatchesPage(),
      ),
      GoRoute(path: leaguesPage, builder: (context, state) => AllLeaguesPage()),
      GoRoute(
        path: leagueDetailsPage,
        builder: (context, state) =>
            LeagueDetailsPage(league: state.extra as LeagueEntity),
      ),
      GoRoute(
        path: matchPage,
        builder: (context, state) =>
            MatchPage(match: state.extra as MatchEntity),
      ),
      GoRoute(
        path: teamPage,
        builder: (context, state) => TeamPage(team: state.extra as TeamEntity),
      ),
      GoRoute(path: contactUsPage, builder: (context, state) => ContactUs()),
    ],
  );
}
