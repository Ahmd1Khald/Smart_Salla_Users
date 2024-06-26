import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/constance/app_strings.dart';
import 'package:salla_users/Features/home/presentation/views/widgets/banner_widget.dart';
import 'package:salla_users/Features/home/presentation/views/widgets/home_categories_item.dart';
import 'package:salla_users/Features/home/presentation/views/widgets/home_cosnt_title.dart';
import 'package:salla_users/Features/home/presentation/views/widgets/latest_arrival_product.dart';
import 'package:salla_users/Features/search/presentation/views/search_secreen.dart';

import '../../../../Core/utiles/app_functions.dart';
import '../../../../Core/utiles/constance/const_variable.dart';
import '../../../../Core/utiles/widgets/shimmer_appbar.dart';
import '../controller/provider/product_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: shimmerAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerWidget(
                banners: AppConst.banners,
              ),
              const HomeConstTitle(title: AppStrings.latestArrivalString),
              Visibility(
                visible: productProvider.getProduct.isNotEmpty,
                child: SizedBox(
                  height: AppConst.size(context).height * 0.147,
                  child: ListView.builder(
                    itemCount: productProvider.getProduct.length,
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                      value: productProvider.getProduct[index],
                      child: const LastArrivalProduct(),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              const HomeConstTitle(title: AppStrings.categoriesString),
              DynamicHeightGridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                builder: (context, index) => InkWell(
                  onTap: () {
                    AppFunction.pushTo(
                      context,
                      SearchScreen(
                          categoryName: AppConst.categoriesItems[index].name),
                    );
                  },
                  child: CategoryItem(model: AppConst.categoriesItems[index]),
                ),
                itemCount: AppConst.categoriesItems.length,
                crossAxisCount: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
