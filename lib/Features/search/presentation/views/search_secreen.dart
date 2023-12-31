import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/app_functions.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';
import 'package:salla_users/Core/utiles/widgets/empty_cart.dart';
import 'package:salla_users/Features/home/data/models/product_model.dart';
import 'package:salla_users/Features/root_screens/presentaiton/views/root_screens.dart';
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

  List<ProductModel> searchResultList = [];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedCategory = widget.categoryName;

    final List<ProductModel> productList = passedCategory == null
        ? productProvider.getProduct
        : productProvider.getCategoryList(categoryName: passedCategory);
    return GestureDetector(
      onTap: () {
        //FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: customAppBar(
              title: widget.categoryName != null
                  ? widget.categoryName!
                  : AppStrings.searchString,
              []),
          body: productList.isEmpty
              ? EmptyCartWidget(
                  function: () {
                    AppFunction.pushAndRemove(context, const RoutScreens());
                  },
                  title: AppStrings.whoopsCategoryString,
                  subTitle: AppStrings.categoryEmptyString,
                  body: AppStrings.looksLikeCategoryString,
                  buttonText: 'Go Back',
                  image: AssetsImages.emptySearch,
                )
              : StreamBuilder<List<ProductModel>>(
                  stream: productProvider.fetchProductsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: TitlesTextWidget(
                          label: snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.data == null) {
                      return const Center(
                        child: TitlesTextWidget(
                          label: "No product has been added",
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            controller: searchTextController,
                            decoration: InputDecoration(
                              hintText: "Search",
                              filled: true,
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  searchTextController.clear();
                                  FocusScope.of(context).unfocus();
                                  // });
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              // setState(() {
                              // searchResultList =
                              //     productProvider.getSearchResultList(
                              //   passedList: productList,
                              //   prodName: searchTextController.text,
                              // );
                              // });
                            },
                            onSubmitted: (value) {
                              setState(() {
                                searchResultList =
                                    productProvider.getSearchResultList(
                                  passedList: productList,
                                  prodName: searchTextController.text,
                                );
                              });
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          if (searchTextController.text.isNotEmpty &&
                              searchResultList.isEmpty) ...[
                            const Center(
                                child: TitlesTextWidget(
                              label: "No results found",
                              fontSize: 40,
                            ))
                          ],
                          Expanded(
                            child: DynamicHeightGridView(
                              itemCount: searchTextController.text.isNotEmpty
                                  ? searchResultList.length
                                  : productList.length,
                              builder: ((context, index) {
                                return ProductItem(
                                  productId:
                                      searchTextController.text.isNotEmpty
                                          ? searchResultList[index].productId
                                          : productList[index].productId,
                                );
                              }),
                              crossAxisCount: 2,
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
    );
  }
}
