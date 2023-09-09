import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/app_functions.dart';
import 'package:salla_users/Features/cart/presentation/controller/provider/cart_provider.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/cart_widget.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/checkout_bottom_sheet.dart';
import 'package:salla_users/Features/root_screens/presentaiton/views/root_screens.dart';

import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/alert_widget.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    //final cartModelProvider = Provider.of<CartModel>(context);
    return cartProvider.getCart.isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              title: AppStrings.whoopsCartString,
              subTitle: AppStrings.cartEmptyString,
              body: AppStrings.looksLikeCartString,
              buttonText: AppStrings.shopNowString,
              image: AssetsImages.bagWish,
              function: () {
                AppFunction.pushAndRemove(context, const RoutScreens());
              },
            ),
          )
        : Scaffold(
            bottomSheet: const CartBottomSheet(),
            appBar: customAppBar(
              [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertWidget(
                              title: 'Remove all cart ?',
                              subTitle1: 'Cancel',
                              subTitle2: 'Yes',
                              func1: () {
                                Navigator.pop(context);
                              },
                              func2: () {
                                cartProvider.clearCartItems();
                                Navigator.pop(context);
                              },
                            ));
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                    size: 28,
                  ),
                )
              ],
              title: AppStrings.shoppingBasketString,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                      value: cartProvider.getCart.values
                          .toList()
                          .reversed
                          .toList()[index],
                      child: const CartWidget(),
                    ),
                    itemCount: cartProvider.getCart.length,
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                )
              ],
            ),
          );
  }
}
