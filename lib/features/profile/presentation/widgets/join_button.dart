import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/utils/shard_pref.dart';
import 'package:live_score_app/core/widgets/custom_animated_button.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(100),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            GoRouter.of(context).go(AppRouters.homePage);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) return CustomLoadingWidget();
          return Center(
            child: CustomAnimatedButton(
              widget: Text('Join Now', style: AppStyles.heading16(context)),
              onTap: () async {
                context.read<ProfileCubit>().createUser();
                await ShardPref.setOnBoarding();
              },
            ),
          );
        },
      ),
    );
  }
}
