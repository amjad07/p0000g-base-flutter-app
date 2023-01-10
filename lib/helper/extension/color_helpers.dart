
import 'package:flutter/cupertino.dart';

extension HexToColor on String {
  Color hexToColor() {
    return Color(int.parse(replaceFirst('#', '0xFF')));
  }
}