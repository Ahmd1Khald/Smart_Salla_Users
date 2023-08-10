import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/const_variable.dart';

import '../../../../../Core/utiles/constance/text_styles/title_text.dart';

class ProductName extends StatelessWidget {
  const ProductName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.size(context).width * 0.6,
      child: TitlesTextWidget(
        label: "Title" * 20,
        maxLines: 2,
      ),
    );
  }
}
