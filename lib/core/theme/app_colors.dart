import 'package:flutter/cupertino.dart';

abstract class AppColors {
  static const baseColor1 = Color(0xFF4776E6);
  static const baseColor2 = Color(0xff8E54E9);
  static const secColor1 = Color(0xff02AAB0);
  static const secColor2 = Color(0xff00CDAC);
  static const grayColor = Color(0xffA4A4A4);
  static const groundColor = Color.fromARGB(255, 15, 0, 33);

  static const blueGradient = LinearGradient(
    colors: [AppColors.baseColor1, AppColors.baseColor2],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const greenGradient = LinearGradient(
    colors: [AppColors.secColor1, AppColors.secColor2],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
