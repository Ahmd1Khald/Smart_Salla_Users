import 'package:flutter/material.dart';

ButtonStyle quantityOutlinedButtonStyle() {
  return OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    side: const BorderSide(
      width: 2,
      color: Colors.blue,
    ),
  );
}
