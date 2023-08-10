import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import '../../../../Core/root_manager.dart';
import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';
import '../../../search/presentation/views/widgets/product_item.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

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
              image: AssetsImages.bagWish,
            ),
          )
        : Scaffold(
            appBar: customAppBar(
              [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    splashColor: Colors.red,
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
              title: 'Wishlist (1)',
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DynamicHeightGridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  builder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.productDetailsRoute);
                        },
                        child: const ProductItem()),
                  ),
                  itemCount: 1,
                  crossAxisCount: 2,
                ),
              ),
            ),
          );
  }
}
