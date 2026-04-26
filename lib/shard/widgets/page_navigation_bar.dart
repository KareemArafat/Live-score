import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_gradient_widget.dart';
import 'package:live_score_app/core/widgets/custom_scaffold.dart';
import 'package:live_score_app/features/day%20matches/presentation/views/day_matches_page.dart';
import 'package:live_score_app/features/fav%20teams/presentation/manager/manage_fav_teams_cubit/manage_fav_teams_cubit.dart';
import 'package:live_score_app/features/fav%20teams/presentation/views/fav_page.dart';
import 'package:live_score_app/features/leagues/presentation/views/all_leagues_page.dart';
import 'package:live_score_app/features/search/presentation/widgets/search_field.dart';
import 'package:live_score_app/features/slider%20menu/presentation/views/slider_menu.dart';

class PageNavigationBar extends StatefulWidget {
  const PageNavigationBar({super.key});

  @override
  State<PageNavigationBar> createState() => _PageNavigationBarState();
}

class _PageNavigationBarState extends State<PageNavigationBar> {
  int currentIndex = 0;

  final List<Widget?> _pagesList = [null, null, null];

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const DayMatchesPage();
      case 1:
        return const AllLeaguesPage();
      case 2:
        return const FavPage();
      default:
        return const SizedBox();
    }
  }

  void _onTabClick(int index) {
    if (currentIndex == index) return;
    setState(() {
      if (_pagesList[index] == null || index == 2) {
        BlocProvider.of<ManageFavTeamsCubit>(context).getFavTeams();
        _pagesList[index] = _buildPage(index);
      }
      currentIndex = index;
    });
  }

  @override
  void initState() {
    _pagesList[0] = _buildPage(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: SearchField(),
      ),
      drawer: SliderMenu(),
      body: IndexedStack(
        index: currentIndex,
        children: _pagesList.map((p) => p ?? const SizedBox()).toList(),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          selectedFontSize: 0,
          currentIndex: currentIndex,
          onTap: _onTabClick,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 12,
          items: [
            BottomNavigationBarItem(
              icon: _barItem(AppImages.matches, 'Matches', context),
              activeIcon: CustomGradientWidget(
                linearGradient: AppColors.blueGradient,
                widget: _barItem(AppImages.matches, 'Matches', context),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _barItem(AppImages.leagues, 'Leagues', context),
              activeIcon: CustomGradientWidget(
                linearGradient: AppColors.blueGradient,
                widget: _barItem(AppImages.leagues, 'Leagues', context),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _barItem(AppImages.fav, 'Favorites', context),
              activeIcon: CustomGradientWidget(
                linearGradient: AppColors.blueGradient,
                widget: _barItem(AppImages.fav, 'Favorites', context),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  Widget _barItem(String image, String label, BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2),
        Image.asset(image, height: context.r(30)),
        Text(label, style: AppStyles.body14(context)),
      ],
    );
  }
}
