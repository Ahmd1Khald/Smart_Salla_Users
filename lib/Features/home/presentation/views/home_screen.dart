import 'package:flutter/material.dart';

import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppStrings.homeString, []),
      body: const Center(
        child: Text(AppStrings.homeString),
      ),
    );
  }
}
