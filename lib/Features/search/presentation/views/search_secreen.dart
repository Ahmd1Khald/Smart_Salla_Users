import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/widgets/empty_cart.dart';
import 'package:salla_users/Features/home/data/models/product_model.dart';
import 'package:salla_users/Features/search/presentation/views/widgets/product_item.dart';

import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../home/presentation/controller/provider/product_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.categoryName,
  });

  final String? categoryName;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> ctgList = widget.categoryName != null
        ? productProvider.getCategoryList(categoryName: widget.categoryName!)
        : [];
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: customAppBar(
              title: widget.categoryName != null
                  ? widget.categoryName!
                  : AppStrings.searchString,
              []),
          body: ctgList.isEmpty
              ? EmptyCartWidget(
                  title: AppStrings.whoopsCategoryString,
                  subTitle: AppStrings.categoryEmptyString,
                  body: AppStrings.looksLikeCategoryString,
                  buttonText: 'Go Back',
                  image: AssetsImages.emptySearch,
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: searchTextController,
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                searchTextController.clear();
                                FocusScope.of(context).unfocus();
                              },
                              child: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          onChanged: (value) {},
                          onSubmitted: (value) {
                            log(searchTextController.text);
                          },
                        ),
                        DynamicHeightGridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          builder: (context, index) => Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: ChangeNotifierProvider.value(
                              value: widget.categoryName != null
                                  ? ctgList[index]
                                  : productProvider.getProduct[index],
                              child: ProductItem(
                                  productId: widget.categoryName != null
                                      ? ctgList[index].productId
                                      : productProvider
                                          .getProduct[index].productId),
                            ),
                          ),
                          itemCount: widget.categoryName != null
                              ? ctgList.length
                              : productProvider.getProduct.length,
                          crossAxisCount: 2,
                        )
                      ],
                    ),
                  ),
                )),
    );
  }
}
