import 'package:flutter/material.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/cart_widget.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/checkout_bottom_sheet.dart';

import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              title: AppStrings.whoopsCartString,
              subTitle: AppStrings.cartEmptyString,
              body: AppStrings.looksLikeCartString,
              buttonText: AppStrings.shopNowString,
              image: AssetsImages.shoppingBasket,
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
              itemBuilder: (context, index) => const CartWidget(),
              itemCount: 15,
            ),
          );
  }
}
