import 'package:flutter/material.dart';

abstract final class TodoAppColor {
  static const int _todoAppPrimaryValue = 0xFFC5C5C5;

  // const color = Color(0xFFC5C5C5)
  static const MaterialColor grayScale = MaterialColor(
    _todoAppPrimaryValue,
    <int, Color>{
      50: Color(0xFFEBEBEB), // 밝은 회색
      100: Color(0xFFD6D6D6), // 조금 더 밝은 회색
      200: Color(0xFFC0C0C0), // 중간 회색
      300: Color(0xFFABABAB), // 약간 짙은 회색
      400: Color(0xFF959595), // 짙은 회색
      500: Color(0xFF808080), // 적당히 어두운 회색
      600: Color(0xFF7A7A7A), // 마지막 어두운 회색
    },
  );

  static Color? getGrayScaleColor(int id) {
    if (id == 0) {
      return grayScale[50];
    } else if (id >= 7) {
      return grayScale[600];
    }
    return grayScale[id * 100];
  }
}
