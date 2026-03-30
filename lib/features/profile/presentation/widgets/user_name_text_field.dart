import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: CustomGradientBorder(
        border: 100,
        linearGradient: AppColors.blueGradient,
        widget: TextField(
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
            hintText: " User Name",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}
