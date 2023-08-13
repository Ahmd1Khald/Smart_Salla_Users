import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';
import 'package:salla_users/Core/utiles/widgets/product_image.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      //step 1
      child: IntrinsicWidth(
        //step 2
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const ProductImage(
                  borderR: 12,
                  size: 0.2,
                  image: 'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png'),
              const SizedBox(
                width: 10.0,
              ),
              IntrinsicWidth(
                //step 3
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // const ProductName(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        TitlesTextWidget(label: 'Price: '),
                        //ProductPrice(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        TitlesTextWidget(label: 'Qty: '),
                        SubtitleTextWidget(label: '10'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
