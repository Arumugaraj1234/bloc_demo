import 'package:flutter/material.dart';

class AppColors {
  static Color orange = HexColor.fromHex("#F28500");
  static Color orangeOpacity70 = HexColor.fromHex("#B3F28500");
  static Color darkOrangeOpacity50 = HexColor.fromHex("#80EE7600");
  static Color darkOrange = HexColor.fromHex("#EE7600");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000");
  static Color green = HexColor.fromHex("#228B22");
  static Color grey3 = HexColor.fromHex("#f6f9fa");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
