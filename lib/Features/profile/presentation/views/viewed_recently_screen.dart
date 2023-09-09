import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/utiles/app_functions.dart';
import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/alert_widget.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';
import '../../../home/presentation/controller/provider/product_provider.dart';
import '../../../root_screens/presentaiton/views/root_screens.dart';
import '../../../search/presentation/views/widgets/product_item.dart';
import '../controller/provider/viewed_recently_provider.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    return viewedRecentlyProvider.getViewedRecently.isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              function: () {
                AppFunction.pushAndRemove(context, const RoutScreens());
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
                    onTap: () {
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
                                  viewedRecentlyProvider
                                      .clearViewedRecentlyItems();
                                  Navigator.pop(context);
                                },
                              ));
                    },
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
              title:
                  'Viewed Recently (${viewedRecentlyProvider.getViewedRecently.length})',
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
                      productId: viewedRecentlyProvider.getViewedRecently.values
                          .toList()[index]
                          .productId,
                    ),
                  ),
                  itemCount: viewedRecentlyProvider.getViewedRecently.length,
                  crossAxisCount: 2,
                ),
              ),
            ),
          );
  }
}
