import 'package:equatable/equatable.dart';

class Stat extends Equatable {
  const Stat({required this.typeId, required this.value});

  final num? typeId;
  final String? value;

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(typeId: json["typeId"], value: json["value"]);
  }

  @override
  List<Object?> get props => [typeId, value];
}
