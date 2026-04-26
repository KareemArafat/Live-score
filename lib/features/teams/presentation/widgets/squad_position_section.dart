import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_player_entity.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/features/teams/presentation/widgets/squad_players_list.dart';
import 'package:live_score_app/features/teams/presentation/widgets/squad_players_item.dart';

class SquadPositionSection extends StatelessWidget {
  const SquadPositionSection({
    super.key,
    required this.sectionName,
    this.players,
    this.coach,
  });
  final String sectionName;
  final List<SquadPlayerEntity>? players;
  final SquadPlayerEntity? coach;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: CustomGradientBorder(
        border: 8,
        linearGradient: AppColors.blueGradient,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  sectionName,
                  style: AppStyles.body14(context).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 6),
              coach != null
                  ? SquadPlayersItem(player: coach!, isCoach: true)
                  : SquadPlayersList(players: players!),
            ],
          ),
        ),
      ),
    );
  }
}
