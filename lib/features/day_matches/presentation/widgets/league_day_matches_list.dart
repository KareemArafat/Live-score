import 'package:flutter/cupertino.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/features/day_matches/presentation/widgets/league_title.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/widgets/match_result_row.dart';

class LeagueDayMatchesList extends StatelessWidget {
  const LeagueDayMatchesList({super.key, required this.leagueMatches});
  final List<MatchEntity> leagueMatches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: context.h(30)),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: leagueMatches.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return LeagueTitle(
            name: leagueMatches.first.leagueName,
            image: leagueMatches.first.leagueImage,
          );
        }
        return MatchResultRow(matchEntity: leagueMatches[index - 1]);
      },
    );
  }
}
