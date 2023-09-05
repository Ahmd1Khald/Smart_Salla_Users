import 'package:flutter/material.dart';

class AppFunction {
  static void pushAndRemove(
    BuildContext context,
    Widget screen,
  ) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }
}
