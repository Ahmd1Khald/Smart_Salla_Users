import 'package:flutter/material.dart';

import '../constance/assets_images.dart';
import 'app_name.dart';

AppBar shimmerAppBar() {
  return AppBar(
    title: const AppName(),
    leading: Image.asset(AssetsImages.shoppingCart),
  );
}
