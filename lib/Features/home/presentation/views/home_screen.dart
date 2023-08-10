import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';
import 'package:salla_users/Features/home/presentation/views/widgets/banner_widget.dart';
import 'package:salla_users/Features/home/presentation/views/widgets/home_cosnt_title.dart';
import 'package:salla_users/Features/home/presentation/views/widgets/latest_arrival_product.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerWidget(
              banners: AppConst.banners,
            ),
            const HomeConstTitle(title: AppStrings.latestArrivalString),
            SizedBox(
              height: AppConst.size(context).height * 0.135,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const LastArrivalProduct(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            //const HomeConstTitle(title: AppStrings.latestArrivalString),
          ],
        ),
      ),
    );
  }
}
