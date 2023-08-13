import 'package:flutter/material.dart';

import '../../../../../Core/utiles/constance/text_styles/subtitle_text.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({Key? key, required this.price}) : super(key: key);

  final String price;
  @override
  Widget build(BuildContext context) {
    return SubtitleTextWidget(
      label: "$price\$",
      fontSize: 20,
      color: Colors.blue,
    );
  }
}
