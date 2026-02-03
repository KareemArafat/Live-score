class NewsInfo {
  final int? id;
  final String? publishDate;
  final int? sourceId;
  final String? title;
  final String? image;
  final String? url;
  final bool? isMagazine;

  const NewsInfo({
    this.id,
    this.publishDate,
    this.sourceId,
    this.title,
    this.image,
    this.url,
    this.isMagazine,
  });

  factory NewsInfo.fromJson(Map<String, dynamic> json) => NewsInfo(
    id: json['id'] as int?,
    publishDate: json['publishDate'] as String?,
    sourceId: json['sourceId'] as int?,
    title: json['title'] as String?,
    image: json['image'] as String?,
    url: json['url'] as String?,
    isMagazine: json['isMagazine'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'publishDate': publishDate,
    'sourceId': sourceId,
    'title': title,
    'image': image,
    'url': url,
    'isMagazine': isMagazine,
  };
}
