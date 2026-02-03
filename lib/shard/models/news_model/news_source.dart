class NewsSource {
  final int? id;
  final String? name;
  final int? imageVersion;

  const NewsSource({this.id, this.name, this.imageVersion});

  factory NewsSource.fromJson(Map<String, dynamic> json) => NewsSource(
    id: json['id'] as int?,
    name: json['name'] as String?,
    imageVersion: json['imageVersion'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageVersion': imageVersion,
  };
}
