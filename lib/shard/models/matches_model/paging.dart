import 'package:equatable/equatable.dart';

class Paging extends Equatable {
  final String? previousPage;
  final String? nextPage;

  const Paging({this.previousPage, this.nextPage});

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    previousPage: json['previousPage'] as String?,
    nextPage: json['nextPage'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'previousPage': previousPage,
    'nextPage': nextPage,
  };

  @override
  List<Object?> get props => [previousPage, nextPage];
}
