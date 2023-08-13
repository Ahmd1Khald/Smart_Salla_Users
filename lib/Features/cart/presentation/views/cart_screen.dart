import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Features/cart/presentation/controller/provider/cart_provider.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/cart_widget.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/checkout_bottom_sheet.dart';

import '../../../../Core/root_manager.dart';
import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItem.isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              title: AppStrings.whoopsCartString,
              subTitle: AppStrings.cartEmptyString,
              body: AppStrings.looksLikeCartString,
              buttonText: AppStrings.shopNowString,
              image: AssetsImages.bagWish,
              function: () {
                Navigator.pushNamed(context, Routes.homeRoute);
              },
            ),
          )
        : Scaffold(
            bottomSheet: const CartBottomSheet(),
            appBar: customAppBar(
              [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                )
              ],
              title: AppStrings.shoppingBasketString,
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: cartProvider.getCartItem.values.toList()[index],
                child: const CartWidget(),
              ),
              itemCount: cartProvider.getCartItem.length,
            ),
          );
  }
}
