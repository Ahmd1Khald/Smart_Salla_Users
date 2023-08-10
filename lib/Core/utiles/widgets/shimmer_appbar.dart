import 'package:flutter/material.dart';

import '../constance/assets_images.dart';
import 'app_name.dart';

AppBar shimmerAppBar() {
  return AppBar(
    title: const AppName(),
    leading: Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Image.asset(AssetsImages.shoppingCart, width: 46),
      ],
    ),
  );
}
