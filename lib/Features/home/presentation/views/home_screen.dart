import 'package:flutter/material.dart';
import 'package:salla_users/Features/home/presentation/views/widgets/banner_widget.dart';

import '../../../../Core/utiles/constance/const_variable.dart';
import '../../../../Core/utiles/widgets/shimmer_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: shimmerAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            BannerWidget(
              banners: AppConst.banners,
            ),
          ],
        ),
      ),
    );
  }
}
