import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/matches/presentation/manager/match_details_cubit/match_details_cubit.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/features/matches/presentation/widgets/events_list.dart';
import 'package:live_score_app/features/matches/presentation/widgets/match_info.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<MatchDetailsCubit, MatchDetailsState>(
        builder: (context, state) {
          if (state is MatchDetailsSuccess) {
            final events = state.matchDetails.events;
            return CustomScrollView(
              slivers: [
                if (events.isNotEmpty) EventsList(events: events),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: MatchInfo(info: state.matchDetails.info),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            );
          } else if (state is MatchDetailsFailure) {
            return Center(child: CustomErrorWidget(errorMess: state.errMess));
          } else {
            return CustomLoadingWidget();
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
