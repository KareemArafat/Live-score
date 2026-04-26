import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGradientBorder(
      border: 100,
      height: context.h(50),
      width: context.w(300),
      linearGradient: AppColors.blueGradient,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(15)),
          child: TextField(
            style: AppStyles.body12(context),
            cursorHeight: context.h(30),
            onChanged: (value) =>
                context.read<ProfileCubit>().updateName(name: value),
            maxLength: 20,
            buildCounter:
                (
                  context, {
                  required int currentLength,
                  required bool isFocused,
                  required int? maxLength,
                }) => null,
            cursorColor: AppColors.baseColor1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: " User Name",
              hintStyle: AppStyles.grayBody12(context),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            ),
          ),
        ),
      ),
    );
  }
}
