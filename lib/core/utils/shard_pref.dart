import 'package:shared_preferences/shared_preferences.dart';

abstract class ShardPref {
  static setOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('key', true);
  }

  static getOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('key') ?? false;
  }
}
