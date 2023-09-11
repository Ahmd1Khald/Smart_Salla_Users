import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Features/home/presentation/views/product_details.dart';

import '../../../../../Core/utiles/app_functions.dart';
import '../../../../../Core/utiles/constance/const_variable.dart';
import '../../../../../Core/utiles/widgets/custom_heart_botton.dart';
import '../../../../../Core/utiles/widgets/my_app_method.dart';
import '../../../../cart/presentation/controller/provider/cart_provider.dart';
import '../../../../profile/presentation/controller/provider/viewed_recently_provider.dart';
import '../../../data/models/product_model.dart';

class LastArrivalProduct extends StatelessWidget {
  const LastArrivalProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModelProvider = Provider.of<ProductModel>(context);
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);

    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          viewedRecentlyProvider.addProductToViewedRecently(
            productId: productModelProvider.productId,
          );
          AppFunction.pushTo(context,
              ProductDetails(productId: productModelProvider.productId));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl: productModelProvider.productImage,
                    boxFit: BoxFit.cover,
                    width: AppConst.size(context).width * 0.15,
                    height: AppConst.size(context).height * 0.11,
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
                          productId: productModelProvider.productId,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () async {
                              // cartProvider.addProductToCart(
                              //     productId: productModelProvider.productId);

                              try {
                                await cartProvider.addProductToCartFirebase(
                                  productId: productModelProvider.productId,
                                  qty: 1,
                                  context: context,
                                );
                              } on FirebaseException catch (error) {
                                MyAppMethods.showErrorORWarningDialog(
                                  context: context,
                                  subtitle: "Error occured $error",
                                  fct: () {},
                                );
                              }
                            },
                            icon: Icon(
                              cartProvider.isProductInCart(
                                      productID: productModelProvider.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_rounded,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    // SubtitleTextWidget(
                    //   label: '${productModelProvider.productPrice}\$',
                    //   color: Colors.blue,
                    //   fontSize: 5,
                    //   maxLines: 1,
                    // ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
