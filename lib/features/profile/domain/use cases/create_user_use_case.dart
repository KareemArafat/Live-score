import 'package:live_score_app/features/profile/domain/repos/profile_repo.dart';

class CreateUserUseCase {
  final ProfileRepo profileRepo;

  CreateUserUseCase(this.profileRepo);

  Future<void> execute({required String image, required String name}) async {
    await profileRepo.createUser(image: image, name: name);
  }
}
