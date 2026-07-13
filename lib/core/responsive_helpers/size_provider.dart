import 'package:flutter/material.dart';

class SizeProvider extends InheritedWidget {
  final Size baseSize;

  const SizeProvider({super.key, required super.child, required this.baseSize});

  static SizeProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SizeProvider>()!;

  @override
  bool updateShouldNotify(SizeProvider oldWidget) => false;
}
