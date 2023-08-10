import 'package:flutter/material.dart';

import '../../../../../Core/utiles/constance/const_variable.dart';
import '../../../../../Core/utiles/constance/text_styles/title_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.model}) : super(key: key);

  final CategoriesModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          model.image,
          width: 60,
        ),
        const SizedBox(
          height: 5,
        ),
        TitlesTextWidget(
          label: model.name,
          fontSize: 15,
        )
      ],
    );
  }
}
