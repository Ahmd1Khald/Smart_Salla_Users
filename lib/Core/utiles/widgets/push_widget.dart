import 'package:flutter/material.dart';

pushTo({required context, required Widget screen}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ));
}
