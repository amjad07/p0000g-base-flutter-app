
import 'package:flutter/material.dart';
import 'package:flutter_base_project/helper/constants/colors_resource.dart';
import 'package:flutter_base_project/helper/extension/color_helpers.dart';

extension SnackbarExtension on BuildContext {
  void showSuccessSnackBar(String msg) {
    final snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(msg),
        backgroundColor: successColor);
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showErrorSnackBar(String msg) {
    final snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(msg),
        backgroundColor: errorColor);
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
