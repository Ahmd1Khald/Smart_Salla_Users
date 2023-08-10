import 'package:flutter/material.dart';

import '../constance/assets_images.dart';
import '../constance/text_styles/title_text.dart';

AppBar customAppBar(List<Widget>? action, {required String title}) {
  return AppBar(
    title: TitlesTextWidget(
      label: title,
      fontSize: 22,
    ),
    leading: Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Image.asset(AssetsImages.shoppingCart, width: 46),
      ],
    ),
    actions: action ?? [],
  );
}
