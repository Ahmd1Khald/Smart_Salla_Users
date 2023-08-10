import 'package:flutter/material.dart';

import '../../../../../Core/utiles/constance/text_styles/title_text.dart';

class HomeConstTitle extends StatelessWidget {
  const HomeConstTitle({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25.0,
      ),
      child: TitlesTextWidget(
        label: title,
        fontSize: 26,
      ),
    );
  }
}
