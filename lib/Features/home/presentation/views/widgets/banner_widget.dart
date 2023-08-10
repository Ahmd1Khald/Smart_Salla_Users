import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utiles/constance/const_variable.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key, required this.banners}) : super(key: key);

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConst.size(context).height * 0.24,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            banners[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: banners.length,
        autoplay: true,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeColor: Colors.red,
            )),
      ),
    );
  }
}
