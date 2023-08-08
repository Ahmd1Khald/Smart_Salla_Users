import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constance/text_styles/title_text.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(seconds: 5),
        baseColor: Colors.purple,
        highlightColor: Colors.red,
        child: const TitlesTextWidget(
          label: 'Smart Salla',
          fontSize: 20,
        ));
  }
}
