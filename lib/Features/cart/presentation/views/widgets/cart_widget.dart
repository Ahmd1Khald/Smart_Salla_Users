import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/product_image.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/product_name.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/product_price.dart';

import '../../../../../Core/utiles/widgets/quantity_outlined_button_style.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

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
                  image: 'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png'),
              const SizedBox(
                width: 10.0,
              ),
              IntrinsicWidth(
                //step 3
                child: Column(
                  children: [
                    Row(
                      children: [
                        const ProductName(),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconlyLight.heart,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ProductPrice(),
                        const Spacer(),
                        OutlinedButton.icon(
                          style: quantityOutlinedButtonStyle(),
                          onPressed: () {},
                          icon: const Icon(IconlyLight.arrowDown2),
                          label: const Text("Qty: 6 "),
                        ),
                      ],
                    )
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
