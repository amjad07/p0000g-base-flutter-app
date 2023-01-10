import 'dart:convert';

import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension Conversion on String {
  String convertStringToBase64() {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(this);
  }
}

extension FormatDate on String {
  String formatDate(String inFormat, String outFormat) {
    DateTime parseDate = DateFormat(inFormat).parse(this);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat(outFormat);
    return outputFormat.format(inputDate);
  }
}
