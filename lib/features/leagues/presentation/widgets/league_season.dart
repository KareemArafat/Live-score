import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_table_cubit/league_table_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';

class LeagueSeason extends StatefulWidget {
  const LeagueSeason({super.key});

  @override
  State<LeagueSeason> createState() => _LeagueSeasonState();
}

class _LeagueSeasonState extends State<LeagueSeason> {
  SeasonEntity? selectedSeason;

  @override
  Widget build(BuildContext context) {
    final leagueProvider = context.watch<LeagueEntityProvider>();

    return DropdownButtonHideUnderline(
      child: DropdownButton2<SeasonEntity>(
        value: selectedSeason,
        hint: Text('2026/2027', style: AppStyles.body12(context)),
        items: leagueProvider.seasons?.map((season) {
          return DropdownMenuItem<SeasonEntity>(
            value: season,
            child: Text(season.name, style: AppStyles.body12(context)),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null && value != selectedSeason) {
            setState(() {
              selectedSeason = value;
              BlocProvider.of<LeagueTableCubit>(context).getLeagueTable(
                leagueId: leagueProvider.leagueEntity.leagueId,
                season: value.num,
              );
            });
          }
        },
        buttonStyleData: ButtonStyleData(
          height: context.rMin(30),
          padding: EdgeInsets.symmetric(
            horizontal: context.w(8),
            vertical: context.h(2),
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: AppColors.blueGradient,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down_sharp),
          iconSize: context.rMin(15),
          iconEnabledColor: Colors.white,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: context.rMin(200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: AppColors.blueGradient,
          ),
          offset: Offset(0, -2),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: context.rMin(40),
          padding: EdgeInsets.only(left: context.w(8)),
        ),
      ),
    );
  }
}
