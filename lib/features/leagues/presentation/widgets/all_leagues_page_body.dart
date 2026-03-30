import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/leagues/presentation/manager/all_leagues_cubit/all_leagues_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/all_leagues_list.dart';

class AllLeaguesPageBody extends StatefulWidget {
  const AllLeaguesPageBody({super.key});

  @override
  State<AllLeaguesPageBody> createState() => _AllLeaguesPageBodyState();
}

class _AllLeaguesPageBodyState extends State<AllLeaguesPageBody> {
  @override
  void initState() {
    BlocProvider.of<AllLeaguesCubit>(context).getAllLeagues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [Expanded(child: AllLeaguesList())]);
  }
}
