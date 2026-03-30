import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String name;

  UserEntity({required this.image, required this.name});
}
