import 'package:hive_flutter/hive_flutter.dart';
import 'package:live_score_app/core/utils/app_const.dart';
import 'package:live_score_app/features/profile/domain/entities/user_entity.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> setUpHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TeamEntityAdapter());
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox<TeamEntity>(AppConst.kFavTeam);
  await Hive.openBox<UserEntity>(AppConst.kUser);
}

String leagueNameSplit(String name) {
  final nameList = name.split('-');
  if (nameList[0].length < 3) {
    nameList.join('-').trim();
    return name;
  }
  return nameList[0];
}

List<List<MatchEntity>> groupMatchesByLeague(List<MatchEntity> matches) {
  final Map<int, List<MatchEntity>> temp = {};
  for (var item in matches) {
    if (AppConst.unLikedLeagues.contains(item.league.leagueId)) continue;
    (temp[item.league.leagueId] ??= []).add(item);
  }
  return temp.values.toList();
}

String getCountryName(int id) {
  final Map countriesNamesMap = {
    for (var item in AppConst.countiesList) item['id']: item['name'],
  };
  return countriesNamesMap[id] ?? '';
}

String getCountryImage(int id) {
  final Map countriesImagesMap = {
    for (var item in AppConst.countiesList) item['id']: item['isoCode'],
  };
  return countriesImagesMap['id'];
}

Future<void> openUrl({required String url}) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Future<void> shareItem({
  required String url,
  String? title,
  String? subTitle,
}) async {
  await SharePlus.instance.share(
    ShareParams(text: url, title: title, subject: subTitle),
  );
}
