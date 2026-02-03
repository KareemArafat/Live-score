import 'package:equatable/equatable.dart';

class AthletePosition extends Equatable {
  const AthletePosition({required this.id, required this.name});

  final int? id;
  final String? name;

  factory AthletePosition.fromJson(Map<String, dynamic> json) {
    return AthletePosition(id: json["id"], name: json["name"]);
  }

  @override
  List<Object?> get props => [id, name];
}
