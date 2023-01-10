import 'dart:developer';

import 'package:flutter/foundation.dart';

void console(String message) {
  if (kDebugMode) {
    log(message);
  }
}