import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

import '../../../../../Core/utiles/widgets/custom_heart_botton.dart';
import '../../../../../Core/utiles/widgets/product_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: Column(
        children: [
          const ProductImage(
            borderR: 25,
            image: 'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
            size: 0.22,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: TitlesTextWidget(
                label: 'Title' * 10,
                maxLines: 2,
              )),
              const HeartButtonWidget(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Expanded(
                  child: SubtitleTextWidget(
                label: '166.5\$',
                fontSize: 21,
              )),
              Material(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.lightBlue,
                child: InkWell(
                  splashColor: Colors.red,
                  borderRadius: BorderRadius.circular(16.0),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_shopping_cart_rounded,
                      size: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
