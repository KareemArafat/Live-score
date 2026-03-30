import 'package:hive_flutter/hive_flutter.dart';
import 'package:live_score_app/core/utils/app_const.dart';
import 'package:live_score_app/features/profile/domain/entities/user_entity.dart';

abstract class ProfileLocalDataSource {
  Future<void> createProfile({required String image, required String name});
}

class ProfileLocalDataSourceImp extends ProfileLocalDataSource {
  @override
  Future<void> createProfile({
    required String image,
    required String name,
  }) async {
    final box = Hive.box<UserEntity>(AppConst.kUser);
    final user = UserEntity(image: image, name: name);
    await box.put(AppConst.kUser, user);
  }
}
