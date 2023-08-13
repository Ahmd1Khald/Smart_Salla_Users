import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/const_variable.dart';

import '../../../../../Core/utiles/constance/text_styles/title_text.dart';

class ProductName extends StatelessWidget {
  const ProductName({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.size(context).width * 0.6,
      child: TitlesTextWidget(
        label: title,
        maxLines: 2,
      ),
    );
  }
}
