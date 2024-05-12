import 'package:flutter/material.dart';

extension Photo on String {
  String png([String? path = "images"]) => 'assets/$path/$this.png';
  String svg([String path = "icons"]) => 'assets/$path/$this.svg';
  String jpg([String path = "images"]) => 'assets/$path/$this.jpg';
}

extension WidgetExtensions on Widget {

  Widget toBoxAdApter() => SliverToBoxAdapter(
        child: this,
      );
}
// context extentions

extension ContextExtensions on BuildContext {
  // size
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;
}
