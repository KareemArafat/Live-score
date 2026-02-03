import 'package:live_score_app/shard/models/news_model/news_info.dart';
import 'package:live_score_app/shard/models/news_model/news_source.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';

class NewsModel {
  final List<NewsInfo> newsInfo;
  final List<NewsSource> newsSources;

  const NewsModel({required this.newsInfo, required this.newsSources});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      newsInfo: json["news"] == null
          ? []
          : List<NewsInfo>.from(json["news"]!.map((x) => NewsInfo.fromJson(x))),
      newsSources: json["newsSources"] == null
          ? []
          : List<NewsSource>.from(
              json["newsSources"]!.map((x) => NewsSource.fromJson(x)),
            ),
    );
  }

  List<NewsEntity> toEntityList() {
    final sourcesMap = {for (var i in newsSources) i.id: i.name};
    return newsInfo.map((x) {
      return NewsEntity(
        newsId: x.id ?? 0,
        title: x.title ?? '',
        image: x.image ?? '',
        url: x.url ?? '',
        date: x.publishDate ?? '',
        source: sourcesMap[x.sourceId] ?? '',
      );
    }).toList();
  }
}
