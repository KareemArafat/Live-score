import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/core/widgets/custom_scaffold.dart';
import 'package:live_score_app/features/profile/domain/use%20cases/create_user_use_case.dart';
import 'package:live_score_app/features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:live_score_app/features/profile/presentation/widgets/start_button.dart';
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
          children: [
            Row(
              children: [
                SizedBox(width: 8),
                Image.asset(AppImages.logo, height: 20),
                SizedBox(width: 10),
                Text('Live Score', style: AppStyles.heading18),
              ],
            ),
            Spacer(),
            Text('Get Started !', style: AppStyles.heading18),
            UserImagesList(),
            UserNameTextField(),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileFailure) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      state.errMess,
                      style: AppStyles.body12.copyWith(color: Colors.redAccent),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
            SizedBox(height: 50),
            StartButton(),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
