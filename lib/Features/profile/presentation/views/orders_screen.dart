import 'package:flutter/material.dart';

import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';
import 'order_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              title: AppStrings.whoopsOrderString,
              subTitle: AppStrings.orderEmptyString,
              body: AppStrings.looksLikeOrderString,
              buttonText: AppStrings.shopNowString,
              image: AssetsImages.bagWish,
            ),
          )
        : Scaffold(
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
              title: AppStrings.ordersString,
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => const OrderWidget(),
              itemCount: 15,
            ),
          );
  }
}
