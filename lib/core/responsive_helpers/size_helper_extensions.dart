import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:live_score_app/core/responsive_helpers/size_provider.dart';

extension SizeHelperExtensions on BuildContext {
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  SizeProvider get sizeProvider => SizeProvider.of(this);
  double get scaleHeight => sizeProvider.height / sizeProvider.baseSize.height;
  double get scaleWidth => sizeProvider.width / sizeProvider.baseSize.width;

  double h(num height) => height * scaleHeight;

  double w(num width) => width * scaleWidth;

  double sp(num fontSize) =>
      isLandscape ? (fontSize * scaleWidth * 0.6) : (fontSize * scaleWidth);

  double r(num size) => isLandscape
      ? size * min(scaleHeight, scaleWidth) * 2
      : size * min(scaleHeight, scaleWidth);

  double rMax(num size) => size * max(scaleHeight, scaleWidth);
}
