import 'package:flutter/material.dart';

BoxShadow shadow(context) => BoxShadow(
      color: Theme.of(context).shadowColor, //, // Shadow color
      spreadRadius: 5, // Spread radius
      blurRadius: 7, // Blur radius
      offset: const Offset(0, 3), // Offset in the x, y direction
    );
