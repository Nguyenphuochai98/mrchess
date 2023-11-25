import 'package:flutter/material.dart';

class UIColors {
  UIColors._();
  static final Color primary = HexColor.fromHex("#455F44");
  static final Color textLight = HexColor.fromHex("#6E6E6E");
  static final Color beige = HexColor.fromHex("#6E6E6E");
  static final Color backgroundBlueNights = HexColor.fromHex("#2f3542");
  static final Color colorButton = HexColor.fromHex("#a4b0be");
  static final Color defaultColorButton = HexColor.fromHex("#1e90ff");
  static final Color backgroundLight = HexColor.fromHex("#34495e");
  static final Color textDartLight = HexColor.fromHex("#ecf0f1");
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    Color color = Colors.black;
    try {
      color = Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {}
    return color;
  }
}
