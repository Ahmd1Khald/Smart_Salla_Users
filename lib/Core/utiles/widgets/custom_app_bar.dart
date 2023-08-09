import 'package:flutter/material.dart';

import '../constance/assets_images.dart';
import '../constance/text_styles/title_text.dart';

AppBar customAppBar(List<Widget>? action, {required String title}) {
  return AppBar(
    title: TitlesTextWidget(
      label: title,
      fontSize: 22,
    ),
    leading: Image.asset(AssetsImages.shoppingCart),
    actions: action ?? [],
  );
}
