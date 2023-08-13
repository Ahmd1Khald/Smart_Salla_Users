import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';

import '../../controller/provider/cart_provider.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({
    Key? key,
    /*required this.model*/
  }) : super(key: key);

  //final CartModel model;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: const Border(top: BorderSide(width: 1, color: Colors.grey))),
      height: kBottomNavigationBarHeight + 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlesTextWidget(
                      label:
                          'Total (${cartProvider.getCart.length} product/${cartProvider.getCartItems()} items)'),
                  SubtitleTextWidget(
                    label:
                        '${cartProvider.getTotal(productProvider: productProvider)}\$',
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            )
          ],
        ),
      ),
    );
  }
}
