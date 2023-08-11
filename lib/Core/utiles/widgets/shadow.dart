import 'package:flutter/material.dart';

BoxShadow shadow() => BoxShadow(
      color: Colors.grey.withOpacity(0.5), // Shadow color
      spreadRadius: 5, // Spread radius
      blurRadius: 7, // Blur radius
      offset: const Offset(0, 3), // Offset in the x, y direction
    );
