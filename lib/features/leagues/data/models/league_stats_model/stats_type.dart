import 'package:equatable/equatable.dart';

class StatsType extends Equatable {
  const StatsType({required this.typeId, required this.name});

  final num? typeId;
  final String? name;

  factory StatsType.fromJson(Map<String, dynamic> json) {
    return StatsType(typeId: json["typeId"], name: json["name"]);
  }

  @override
  List<Object?> get props => [typeId, name];
}
