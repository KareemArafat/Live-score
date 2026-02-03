import 'package:equatable/equatable.dart';

class FormationPosition extends Equatable {
  const FormationPosition({
    required this.id,
    required this.name,
    required this.order,
  });

  final int? id;
  final String? name;
  final int? order;

  factory FormationPosition.fromJson(Map<String, dynamic> json) {
    return FormationPosition(
      id: json["id"],
      name: json["name"],
      order: json["order"],
    );
  }

  @override
  List<Object?> get props => [id, name, order];
}
