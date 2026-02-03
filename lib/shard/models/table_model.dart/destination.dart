import 'package:equatable/equatable.dart';

class Destination extends Equatable {
  const Destination({
    required this.num,
    required this.name,
    required this.guaranteedText,
    required this.color,
    required this.type,
  });

  final int? num;
  final String? name;
  final String? guaranteedText;
  final String? color;
  final int? type;

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      num: json["num"],
      name: json["name"],
      guaranteedText: json["guaranteedText"],
      color: json["color"],
      type: json["type"],
    );
  }

  @override
  List<Object?> get props => [num, name, guaranteedText, color, type];
}
