import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/widgets/product_image.dart';
import 'package:salla_users/Features/cart/data/model/cart_model.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/product_name.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/product_price.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/quantity_bottom_sheet.dart';

import '../../../../../Core/utiles/widgets/custom_heart_botton.dart';
import '../../../../../Core/utiles/widgets/quantity_outlined_button_style.dart';
import '../../../../home/presentation/controller/provider/product_provider.dart';
import '../../controller/provider/cart_provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final getCurrProduct =
        productProvider.findProductId(proId: cartModelProvider.productId);

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
            //step 1
            child: IntrinsicWidth(
              //step 2
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ProductImage(
                        borderR: 12,
                        size: 0.2,
                        image: getCurrProduct.productImage),
                    const SizedBox(
                      width: 10.0,
                    ),
                    IntrinsicWidth(
                      //step 3
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ProductName(
                                title: getCurrProduct.productTitle,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartProvider.removeCartItemFromFirebase(
                                          cartId: cartModelProvider.cartId,
                                          qty: cartModelProvider.quantity,
                                          productId: getCurrProduct.productId);
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                  ),
                                  HeartButtonWidget(
                                    productId: getCurrProduct.productId,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductPrice(
                                price: getCurrProduct.productPrice,
                              ),
                              const Spacer(),
                              OutlinedButton.icon(
                                style: quantityOutlinedButtonStyle(),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    )),
                                    context: context,
                                    builder: (context) => QuantityBottomSheet(
                                        model: cartModelProvider),
                                  );
                                },
                                icon: const Icon(IconlyLight.arrowDown2),
                                label:
                                    Text("Qtp: ${cartModelProvider.quantity}"),
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
