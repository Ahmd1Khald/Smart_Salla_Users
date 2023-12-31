import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/app_functions.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';
import 'package:salla_users/Core/utiles/widgets/my_app_method.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';
import 'package:salla_users/Features/home/presentation/views/product_details.dart';

import '../../../../../Core/utiles/widgets/custom_heart_botton.dart';
import '../../../../../Core/utiles/widgets/product_image.dart';
import '../../../../cart/presentation/controller/provider/cart_provider.dart';
import '../../../../profile/presentation/controller/provider/viewed_recently_provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    // print(productId);
    // print('productId ++++++++++++++++++++');
    //final productModelProvider = Provider.of<ProductModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productProvider.findProductId(proId: productId);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : InkWell(
            onTap: () {
              viewedRecentlyProvider.addProductToViewedRecently(
                productId: getCurrProduct.productId,
              );
              AppFunction.pushTo(
                context,
                ProductDetails(
                  productId: getCurrProduct.productId,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Column(
                children: [
                  ProductImage(
                    borderR: 25,
                    image: getCurrProduct.productImage,
                    size: 0.22,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TitlesTextWidget(
                        label: getCurrProduct.productTitle,
                        maxLines: 3,
                      )),
                      HeartButtonWidget(
                        productId: getCurrProduct.productId,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SubtitleTextWidget(
                        label: "${getCurrProduct.productPrice}\$",
                        fontSize: 21,
                      )),
                      Material(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.lightBlue,
                        child: InkWell(
                          splashColor: Colors.red,
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () async {
                            // cartProvider.addProductToCart(
                            //     productId: getCurrProduct.productId);
                            try {
                              await cartProvider.addProductToCartFirebase(
                                productId: getCurrProduct.productId,
                                qty: getCurrProduct.productQuantity,
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              cartProvider.isProductInCart(
                                      productID: getCurrProduct.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_rounded,
                              size: 21,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
