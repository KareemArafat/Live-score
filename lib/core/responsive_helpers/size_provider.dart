import 'package:flutter/cupertino.dart';

class SizeProvider extends InheritedWidget {
  final Size baseSize;
  final double height;
  final double width;

  const SizeProvider({
    super.key,
    required super.child,
    required this.baseSize,
    required this.height,
    required this.width,
  });

  static SizeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SizeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant SizeProvider oldWidget) {
    return baseSize != oldWidget.baseSize ||
        height != oldWidget.height ||
        width != oldWidget.width;
  }
}
