import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/profile/domain/use%20cases/create_user_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.createUserUseCase) : super(ProfileInitial());

  final CreateUserUseCase createUserUseCase;

  String? cubitImage;
  String? cubitName;

  void updateImage({required String image}) => cubitImage = image;
  void updateName({required String name}) => cubitName = name;

  Future<void> createUser() async {
    emit(ProfileLoading());
    await Future.delayed(Duration(seconds: 1));
    if (cubitName == null || cubitName!.isEmpty) {
      emit(ProfileFailure(errMess: "Please enter your name"));
      return;
    }
    if (cubitName!.length <= 2) {
      emit(ProfileFailure(errMess: "User Name must be at least 3 characters"));
      return;
    }
    await createUserUseCase.execute(image: cubitImage!, name: cubitName!);
    emit(ProfileSuccess());
  }
}
