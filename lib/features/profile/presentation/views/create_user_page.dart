import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/core/widgets/custom_scaffold.dart';
import 'package:live_score_app/features/profile/domain/use%20cases/create_user_use_case.dart';
import 'package:live_score_app/features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:live_score_app/features/profile/presentation/widgets/join_button.dart';
import 'package:live_score_app/features/profile/presentation/widgets/user_images_list.dart';
import 'package:live_score_app/features/profile/presentation/widgets/user_name_text_field.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt<CreateUserUseCase>()),
      child: CustomScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: context.w(12)),
                Image.asset(
                  AppImages.logo,
                  fit: BoxFit.contain,
                  height: context.sp(15),
                ),
                SizedBox(width: 10),
                Text('Live Score', style: AppStyles.heading16(context)),
              ],
            ),
            Spacer(),
            Text('Get Started !', style: AppStyles.heading18(context)),
            Spacer(),
            UserImagesList(),
            Spacer(flex: 2),
            UserNameTextField(),
            Spacer(),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileFailure) {
                  return Text(
                    state.errMess,
                    style: AppStyles.body12(
                      context,
                    ).copyWith(color: Colors.redAccent),
                  );
                }
                return Text(' ', style: AppStyles.body12(context));
              },
            ),
            Spacer(flex: 2),
            JoinButton(),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
