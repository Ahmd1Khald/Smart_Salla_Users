import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:salla_users/Core/utiles/widgets/product_image.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/product_name.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/product_price.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/quantity_bottom_sheet.dart';

import '../../../../../Core/utiles/widgets/custom_heart_botton.dart';
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
                  borderR: 12,
                  size: 0.2,
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
                            const HeartButtonWidget(),
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
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              )),
                              context: context,
                              builder: (context) => const QuantityBottomSheet(),
                            );
                          },
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
