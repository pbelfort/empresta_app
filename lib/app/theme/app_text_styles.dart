import 'package:flutter/material.dart';

extension TxTheme on TextStyle {
  /// fontWeight: FontWeight.bold
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  /// fontWeight: FontWeight.normal
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  /// FontWeight.w400
  TextStyle get thin => copyWith(fontWeight: FontWeight.w400);

  /// fontSize: 24
  TextStyle get xs => copyWith(fontSize: 12);

  /// fontSize: 24
  TextStyle get md => copyWith(fontSize: 14);

  /// fontSize: 24
  TextStyle get lg => copyWith(fontSize: 18);

  /// fontSize: 24
  TextStyle get xl => copyWith(fontSize: 24);

  /// set fontSize to [fontSize]
  TextStyle fs(double fontSize) => copyWith(fontSize: fontSize);

  /// set Color to [color]
  TextStyle cl(Color color) => copyWith(color: color);

  /// set [FontWeight] to [fontWeight]
  TextStyle fw(FontWeight fw) => copyWith(fontWeight: fw);

  /// set [double] to [letterSpacing]
  TextStyle ls(double ls) => copyWith(letterSpacing: ls);

  /// set fontStyle to [FontStyle.italic]
  TextStyle get it => copyWith(fontStyle: FontStyle.italic);
}

const TextStyle defaultTextStyle = TextStyle(
  fontSize: 16,
  letterSpacing: 0.15,
  height: 1.28,
  fontWeight: FontWeight.w400,
);
