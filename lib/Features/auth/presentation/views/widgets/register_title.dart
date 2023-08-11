import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/app_color.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitlesTextWidget(label: 'Welcome back!'),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 130,
          height: 2,
          color: AppColors.lineColor,
        ),
      ],
    );
  }
}
