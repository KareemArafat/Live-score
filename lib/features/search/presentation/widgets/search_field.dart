import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/features/search/domain/entities/search_result_entity.dart';
import 'package:live_score_app/features/search/presentation/manager/search%20result%20cubit/search_result_cubit.dart';
import 'package:live_score_app/features/search/presentation/widgets/item_title.dart';
import 'package:live_score_app/features/search/presentation/widgets/item_view.dart';
import 'package:live_score_app/features/search/presentation/widgets/search_text_field.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<SearchResultEntity>(
      hideOnEmpty: true,
      hideOnError: true,
      controller: searchController,
      debounceDuration: Duration(milliseconds: 400),
      constraints: BoxConstraints(maxHeight: 500),
      onSelected: (item) {},
      loadingBuilder: (context) =>
          Container(color: AppColors.groundColor, child: CustomLoadingWidget()),
      suggestionsCallback: (text) async =>
          await context.read<SearchResultCubit>().getSuggestions(text),
      builder: (context, searchController, searchFocusNode) => SearchTextField(
        controller: searchController,
        focusNode: searchFocusNode,
      ),
      itemBuilder: (context, item) {
        return Container(
          color: AppColors.groundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.leagueEntity.isNotEmpty) ...[
                ItemTitle(title: "Leagues"),
                ...item.leagueEntity.map(
                  (league) => ItemView(
                    itemName: league.leagueName,
                    itemImage: league.leagueImage,
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouters.leagueDetailsPage, extra: league);
                      searchController.clear();
                    },
                  ),
                ),
              ],
              if (item.teamEntity.isNotEmpty) ...[
                ItemTitle(title: "Teams"),
                ...item.teamEntity.map(
                  (team) => ItemView(
                    itemName: team.teamName,
                    itemImage: team.teamImage,
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouters.teamPage, extra: team);
                      searchController.clear();
                    },
                  ),
                ),
              ],
              if (item.playerEntity.isNotEmpty) ...[
                ItemTitle(title: "Players"),
                ...item.playerEntity.map(
                  (player) => ItemView(
                    itemName: player.playerName,
                    itemImage: player.playerImage,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
