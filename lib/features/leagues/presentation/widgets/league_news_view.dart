import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_news_cubit/league_news_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/shard/widgets/news_list_item.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class LeagueNewsView extends StatefulWidget {
  const LeagueNewsView({super.key});

  @override
  State<LeagueNewsView> createState() => _LeagueNewsViewState();
}

class _LeagueNewsViewState extends State<LeagueNewsView>
    with AutomaticKeepAliveClientMixin {
  late LeagueEntity leagueEntity;
  late LeagueNewsCubit cubit;

  @override
  void initState() {
    leagueEntity = context.read<LeagueEntityProvider>().leagueEntity;
    cubit = BlocProvider.of<LeagueNewsCubit>(context)
      ..getLeagueNews(leagueId: leagueEntity.leagueId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<LeagueNewsCubit, LeagueNewsState>(
      builder: (context, state) {
        if (state is NewsSuccess) {
          final newsList = state.newsList;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: context.w(24)),
            itemCount: newsList.length,
            itemBuilder: (context, index) =>
                NewsListItem(newsEntity: newsList[index]),
          );
        } else if (state is NewsFailure) {
          return CustomErrorWidget(
            errorMess: state.errMess,
            onPressed: () =>
                cubit.getLeagueNews(leagueId: leagueEntity.leagueId),
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
