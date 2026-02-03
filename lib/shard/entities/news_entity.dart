class NewsEntity {
  final int newsId;
  final String date;
  final String source;
  final String title;
  final String image;
  final String url;

  const NewsEntity({
    required this.newsId,
    required this.date,
    required this.source,
    required this.title,
    required this.image,
    required this.url,
  });
}
