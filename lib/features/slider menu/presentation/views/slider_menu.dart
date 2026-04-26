import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/app_const.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/features/profile/domain/entities/user_entity.dart';
import 'package:live_score_app/features/slider%20menu/presentation/widgets/slider_menu_item.dart';
import 'package:live_score_app/features/slider%20menu/presentation/widgets/user_image.dart';

class SliderMenu extends StatelessWidget {
  const SliderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Hive.box<UserEntity>(AppConst.kUser).get(AppConst.kUser);

    return Drawer(
      backgroundColor: AppColors.groundColor,
      shadowColor: AppColors.baseColor1,

      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.symmetric(vertical: context.h(20)),
            child: Column(
              children: [
                UserImage(image: user?.image ?? ''),
                SizedBox(height: 10),
                Text(
                  user?.name ?? '',
                  style: AppStyles.heading18(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SliderMenuItem(
            iconData: Icons.notifications,
            tittle: 'Notifications',
            onTap: () {},
          ),
          SliderMenuItem(
            iconData: Icons.share,
            tittle: 'Share App',
            onTap: () => shareItem(
              url:
                  'The best live score app is here! ⚽\n\n'
                  'https://github.com/KareemArafat/Live-score',
            ),
          ),
          SliderMenuItem(
            iconData: Icons.support_agent,
            tittle: 'Contact US',
            onTap: () => GoRouter.of(context).push(AppRouters.contactUsPage),
          ),
        ],
      ),
    );
  }
}
