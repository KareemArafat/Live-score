import 'package:hive_flutter/hive_flutter.dart';
import 'package:live_score_app/core/utils/app_const.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> setUpHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TeamEntityAdapter());
  await Hive.openBox<TeamEntity>(AppConst.kFavTeam);
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
  final Map countriesMap = {
    for (var item in AppConst.countiesList) item['id']: item['name'],
  };
  return countriesMap[id] ?? '';
}

Future<void> openUrl({required String newsUrl}) async {
  final Uri uri = Uri.parse(newsUrl);
  // await launchUrl(uri);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}
