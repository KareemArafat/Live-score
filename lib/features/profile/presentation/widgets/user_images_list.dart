import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:live_score_app/features/profile/presentation/widgets/user_images_list_item.dart';

class UserImagesList extends StatefulWidget {
  const UserImagesList({super.key});

  @override
  State<UserImagesList> createState() => _UserImagesListState();
}

class _UserImagesListState extends State<UserImagesList> {
  final PageController controller = PageController(viewportFraction: 0.5);
  late ProfileCubit cubit;
  double currentPage = 0;

  final List<String> images = [
    'assets/users/user1.png',
    'assets/users/user2.png',
    'assets/users/user3.png',
    'assets/users/user4.png',
    'assets/users/user5.png',
    'assets/users/user6.png',
    'assets/users/user7.png',
    'assets/users/user8.png',
  ];
  @override
  void initState() {
    cubit = context.read<ProfileCubit>()..updateImage(image: images[0]);
    controller.addListener(() {
      setState(() => currentPage = controller.page!);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(250),
      child: PageView.builder(
        controller: controller,
        itemCount: images.length,
        onPageChanged: (index) => cubit.updateImage(image: images[index]),
        itemBuilder: (context, index) {
          double diff = (currentPage - index).abs();
          double scale = (1 - (diff * 0.3)).clamp(0.7, 1.0);
          return AnimatedScale(
            scale: scale,
            duration: Duration(milliseconds: 200),
            child: UserImagesListItem(image: images[index]),
          );
        },
      ),
    );
  }
}
