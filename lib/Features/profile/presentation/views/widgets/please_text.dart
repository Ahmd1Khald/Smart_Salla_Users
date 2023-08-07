import 'package:flutter/material.dart';

import '../../../../../Core/utiles/constance/app_strings.dart';
import '../../../../../Core/utiles/constance/text_styles/title_text.dart';

class PleaseText extends StatelessWidget {
  const PleaseText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: TitlesTextWidget(label: AppStrings.pleaseString),
    );
  }
}
