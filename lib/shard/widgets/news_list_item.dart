import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key, required this.newsEntity});
  final NewsEntity newsEntity;

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(newsEntity.date);
    String formattedDate = DateFormat('dd/MM/yyyy  hh:mm a').format(parsedDate);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: AppColors.grayColor,
              child: AspectRatio(
                aspectRatio: 2 / 1.2,
                child: CachedNetworkImage(
                  imageUrl: newsEntity.image,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Icon(Icons.image_not_supported_outlined),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () => openUrl(url: newsEntity.url),
            child: Text(
              newsEntity.title,
              style: AppStyles.heading16(context).copyWith(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(newsEntity.source, style: AppStyles.grayBody10(context)),
              Spacer(),
              Text(formattedDate, style: AppStyles.grayBody10(context)),
            ],
          ),
        ],
      ),
    );
  }
}
