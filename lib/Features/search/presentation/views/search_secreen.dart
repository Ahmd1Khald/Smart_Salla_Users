import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:salla_users/Features/search/presentation/views/widgets/product_item.dart';

import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';

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
                          setState(() {
                            searchTextController.clear();
                            FocusScope.of(context).unfocus();
                          });
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
                    builder: (context, index) => const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: ProductItem(),
                    ),
                    itemCount: 200,
                    crossAxisCount: 2,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
