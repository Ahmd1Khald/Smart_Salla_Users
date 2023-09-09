import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/utiles/app_functions.dart';
import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/alert_widget.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';
import '../../../root_screens/presentaiton/views/root_screens.dart';
import '../../../search/presentation/views/widgets/product_item.dart';
import '../controller/provider/wish_list_provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
    return wishListProvider.getWishList.isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              function: () {
                AppFunction.pushAndRemove(context, const RoutScreens());
              },
              title: AppStrings.whoopsWishListString,
              subTitle: AppStrings.wishListEmptyString,
              body: AppStrings.looksLikeWishListString,
              buttonText: AppStrings.shopNowString,
              image: AssetsImages.bagWish,
            ),
          )
        : Scaffold(
            appBar: customAppBar(
              [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertWidget(
                              title: 'Remove all wish list ?',
                              subTitle1: 'Cancel',
                              subTitle2: 'Yes',
                              func1: () {
                                Navigator.pop(context);
                              },
                              func2: () {
                                wishListProvider.clearWishListItems();
                                Navigator.pop(context);
                              },
                            ));
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                    size: 28,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
              title: 'Wishlist (${wishListProvider.getWishList.length})',
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DynamicHeightGridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  builder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ProductItem(
                      productId: wishListProvider.getWishList.values
                          .toList()[index]
                          .productId,
                    ),
                  ),
                  itemCount: wishListProvider.getWishList.length,
                  crossAxisCount: 2,
                ),
              ),
            ),
          );
  }
}
