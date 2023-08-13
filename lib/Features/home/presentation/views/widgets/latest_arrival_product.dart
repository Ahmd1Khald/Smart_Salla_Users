import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';

import '../../../../../Core/utiles/constance/const_variable.dart';
import '../../../../../Core/utiles/widgets/custom_heart_botton.dart';
import '../../../data/models/product_model.dart';

class LastArrivalProduct extends StatelessWidget {
  const LastArrivalProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModelProvider = Provider.of<ProductModel>(context);

    //final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl: productModelProvider.productImage,
                  width: AppConst.size(context).width * 0.2,
                  height: AppConst.size(context).height * 0.12,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: AppConst.size(context).width * 0.26,
                    child: SubtitleTextWidget(
                      label: productModelProvider.productTitle,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      HeartButtonWidget(
                          productId: productModelProvider.productId),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart_checkout)),
                    ],
                  ),
                  SubtitleTextWidget(
                    label: '${productModelProvider.productPrice}\$',
                    color: Colors.blue,
                    maxLines: 1,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
