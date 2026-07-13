import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_table_cubit/league_table_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/shard/widgets/table_details_bar.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/shard/widgets/table_item.dart';

class LeagueTableView extends StatefulWidget {
  const LeagueTableView({super.key});

  @override
  State<LeagueTableView> createState() => _LeagueTableViewState();
}

class _LeagueTableViewState extends State<LeagueTableView>
    with AutomaticKeepAliveClientMixin {
  late LeagueTableCubit cubit;
  late LeagueEntity leagueEntity;

  @override
  void initState() {
    leagueEntity = context.read<LeagueEntityProvider>().leagueEntity;
    cubit = BlocProvider.of<LeagueTableCubit>(context)
      ..getLeagueTable(leagueId: leagueEntity.leagueId, season: null);
    super.initState();
  }

  void setSeasonsList(List seasons) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LeagueEntityProvider>().setSeasons(seasons);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<LeagueTableCubit, LeagueTableState>(
      builder: (context, state) {
        if (state is TableSuccess) {
          setSeasonsList(state.table.seasons);
          final tableList = state.table.rows;
          return ListView.builder(
            padding: EdgeInsets.only(top: context.h(20)),
            itemCount: tableList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return TableDetailsBar();
              }
              return TableItem(teamRow: tableList[index - 1]);
            },
          );
        } else if (state is TableFailure) {
          return CustomErrorWidget(
            errorMess: state.errorMess,
            onPressed: () => cubit.getLeagueTable(
              leagueId: leagueEntity.leagueId,
              season: leagueEntity.seasonNum,
            ),
          );
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
