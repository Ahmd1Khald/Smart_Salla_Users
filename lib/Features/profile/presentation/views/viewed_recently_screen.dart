import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/root_manager.dart';
import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';
import '../../../home/presentation/controller/provider/product_provider.dart';
import '../../../search/presentation/views/widgets/product_item.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    //productProvider.findProductId == null?isEmpty=true:isEmpty=false;
    return isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              function: () {
                Navigator.pushNamed(context, Routes.homeRoute);
              },
              title: AppStrings.whoopsViewedRecentlyString,
              subTitle: AppStrings.wishListEmptyString,
              body: AppStrings.looksLikeViewedRecentlyString,
              buttonText: AppStrings.shopNowString,
              image: AssetsImages.bagWish,
            ),
          )
        : Scaffold(
            appBar: customAppBar(
              [
                Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.lightBlue,
                  child: InkWell(
                    splashColor: Colors.red,
                    borderRadius: BorderRadius.circular(16.0),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
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
              title: 'Viewed Recently (1)',
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DynamicHeightGridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  builder: (context, index) => const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ProductItem(
                      productId: '',
                    ),
                  ),
                  itemCount: 1,
                  crossAxisCount: 2,
                ),
              ),
            ),
          );
  }
}
