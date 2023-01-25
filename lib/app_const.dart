import 'package:flutter/animation.dart';

abstract class AppConstants {
  static const defaultTransition = Duration(milliseconds: 300);
  static const defaultPageTransition = Duration(milliseconds: 1000);

  static const borderRadius = 19.0;
  static const borderRadiusBig = 40.0;

  static const authFormSizeMin = Size(320, 160);
  static const authFormSizeMax = Size(340, 210);
  
  static const phoneLength = 13;

  static void borderPrint(
    text, {
    int borderWidth = 107,
    String title = 'Вывод',
    String borderSimbol = '=',
  }) {
    const _numberGenerate = 19;

    var _border = List.generate(borderWidth, (_) => _numberGenerate)
        .join('')
        .replaceAll('$_numberGenerate', borderSimbol);
    // ignore: avoid_print
    print('$_border\n$title: $text\n$_border');
  }
}
