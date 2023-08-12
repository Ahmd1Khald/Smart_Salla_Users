import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

import '../../../../../Core/utiles/widgets/custom_heart_botton.dart';
import '../../../../../Core/utiles/widgets/product_image.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../home/presentation/controller/provider/product_provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.model}) : super(key: key);

  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: Column(
        children: [
          ProductImage(
            borderR: 25,
            image: model.productImage,
            size: 0.22,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: TitlesTextWidget(
                label: model.productTitle,
                maxLines: 2,
              )),
              const HeartButtonWidget(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: SubtitleTextWidget(
                label: model.productPrice,
                fontSize: 21,
              )),
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
                      Icons.add_shopping_cart_rounded,
                      size: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
