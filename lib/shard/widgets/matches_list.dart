import 'package:flutter/cupertino.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/widgets/match_result_row.dart';

class MatchesList extends StatelessWidget {
  const MatchesList({super.key, required this.weekMatches});
  final List<MatchEntity> weekMatches;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: weekMatches.length,
        itemBuilder: (context, index) =>
            MatchResultRow(match: weekMatches[index]),
      ),
    );
  }
}
