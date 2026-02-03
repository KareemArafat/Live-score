import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key, required this.news});
  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    DateTime? parsedDate = DateTime.parse(news.date);
    String formattedDate = DateFormat('dd/MM/yyyy  hh:mm a').format(parsedDate);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 2 / 1.2,
              child: CachedNetworkImage(
                imageUrl: news.image,
                fit: BoxFit.fill,
                placeholder: (context, url) => Container(
                  color: AppColors.grayColor,
                  child: CustomLoadingWidget(size: 10),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.grayColor,
                  child: Icon(Icons.image_not_supported_outlined),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () => openUrl(newsUrl: news.url),
            child: Text(
              news.title,
              style: AppStyles.heading16.copyWith(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(news.source, style: AppStyles.grayBody10),
              Spacer(),
              Text(formattedDate, style: AppStyles.grayBody10),
            ],
          ),
        ],
      ),
    );
  }
}
