import 'package:flutter/material.dart';

import '../../../../../Core/utiles/constance/text_styles/title_text.dart';

class ProductName extends StatelessWidget {
  const ProductName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.6,
      child: TitlesTextWidget(
        label: "Title" * 20,
        maxLines: 2,
      ),
    );
  }
}
