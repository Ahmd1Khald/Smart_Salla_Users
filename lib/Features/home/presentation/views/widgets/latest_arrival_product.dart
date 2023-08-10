import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';

import '../../../../../Core/utiles/constance/const_variable.dart';

class LastArrivalProduct extends StatelessWidget {
  const LastArrivalProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl:
                      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                  width: AppConst.size(context).width * 0.2,
                  height: AppConst.size(context).height * 0.12,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: AppConst.size(context).width * 0.26,
                    child: const SubtitleTextWidget(
                      label: 'iphone x max fax off ahh',
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(IconlyLight.heart)),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart_checkout)),
                    ],
                  ),
                  const SubtitleTextWidget(
                    label: '1399.99\$',
                    color: Colors.blue,
                    maxLines: 1,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
