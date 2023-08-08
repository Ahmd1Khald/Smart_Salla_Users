import 'package:flutter/material.dart';

import '../../../../../Core/utiles/constance/text_styles/subtitle_text.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubtitleTextWidget(
      label: "16\$",
      fontSize: 20,
      color: Colors.blue,
    );
  }
}
