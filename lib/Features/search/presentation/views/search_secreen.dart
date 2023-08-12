import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Features/search/presentation/views/widgets/product_item.dart';

import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../home/presentation/controller/provider/product_provider.dart';
import '../../../home/presentation/views/product_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: customAppBar(title: AppStrings.searchString, []),
          body: SingleChildScrollView(
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChangeNotifierProvider.value(
                                value: productProvider.getProduct[index],
                                child: ProductDetails(
                                  model: productProvider.getProduct[index],
                                ),
                              ),
                            ),
                          );
                        },
                        child: ChangeNotifierProvider.value(
                          value: productProvider.getProduct[index],
                          child: ProductItem(
                            model: productProvider.getProduct[index],
                          ),
                        ),
                      ),
                    ),
                    itemCount: productProvider.getProduct.length,
                    crossAxisCount: 2,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
