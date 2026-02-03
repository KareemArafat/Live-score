import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/shard/widgets/news_list_item.dart';
import 'package:live_score_app/features/teams/presentation/manager/team_news_cubit/team_news_cubit.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class TeamNewsView extends StatefulWidget {
  const TeamNewsView({super.key, required this.teamId});
  final int teamId;
  @override
  State<TeamNewsView> createState() => _TeamNewsViewState();
}

class _TeamNewsViewState extends State<TeamNewsView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    context.read<TeamNewsCubit>().getTeamNews(teamId: widget.teamId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TeamNewsCubit, TeamNewsState>(
      builder: (context, state) {
        if (state is TeamNewsSuccess) {
          final news = state.news;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 25),
            itemCount: news.length,
            itemBuilder: (context, index) => NewsListItem(news: news[index]),
          );
        } else if (state is TeamNewsFailure) {
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
