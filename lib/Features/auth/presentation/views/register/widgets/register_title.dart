import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

import '../../../../../../Core/utiles/constance/app_color.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, top: 5.0),
      child: Column(
        children: [
          TitlesTextWidget(
            label: title,
            fontSize: 21,
          ),
          Container(
            width: 230,
            height: 2,
            color: AppColors.lineColor,
          ),
        ],
      ),
    );
  }
}
