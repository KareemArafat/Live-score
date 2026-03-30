import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/utils/shard_pref.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(25);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          GoRouter.of(context).go(AppRouters.homePage);
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) return CustomLoadingWidget();
        return Container(
          decoration: BoxDecoration(
            gradient: AppColors.blueGradient,
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                color: AppColors.baseColor2.withAlpha(120),
                blurRadius: 30,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: radius,
            child: InkWell(
              borderRadius: radius,
              onTap: () async {
                context.read<ProfileCubit>().createUser();
                await ShardPref.setOnBoarding();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Text('Join Now', style: AppStyles.heading16),
              ),
            ),
          ),
        );
      },
    );
  }
}
