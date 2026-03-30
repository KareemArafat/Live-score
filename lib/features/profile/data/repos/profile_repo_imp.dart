import 'package:live_score_app/features/profile/data/data%20source/profile_local_data_source.dart';
import 'package:live_score_app/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImp extends ProfileRepo {
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepoImp(this.profileLocalDataSource);
  @override
  Future<void> createUser({required String image, required String name}) async {
    await profileLocalDataSource.createProfile(image: image, name: name);
  }
}
