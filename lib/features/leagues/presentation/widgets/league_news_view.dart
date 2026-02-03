import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_news_cubit/league_news_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/shard/widgets/news_list_item.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class LeagueNewsView extends StatefulWidget {
  const LeagueNewsView({super.key});

  @override
  State<LeagueNewsView> createState() => _LeagueNewsViewState();
}

class _LeagueNewsViewState extends State<LeagueNewsView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    final league = context.read<LeagueEntityProvider>().league;

    BlocProvider.of<LeagueNewsCubit>(
      context,
    ).getLeagueNews(leagueId: league.leagueId);
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
            padding: EdgeInsets.symmetric(horizontal: 25),
            itemCount: newsList.length,
            itemBuilder: (context, index) =>
                NewsListItem(news: newsList[index]),
          );
        } else if (state is NewsFailure) {
          return Center(child: Text(state.errMess));
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
