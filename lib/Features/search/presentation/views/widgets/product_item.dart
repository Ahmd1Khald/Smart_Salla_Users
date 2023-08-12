import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';
import 'package:salla_users/Core/utiles/widgets/push_widget.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';
import 'package:salla_users/Features/home/presentation/views/product_details.dart';

import '../../../../../Core/utiles/widgets/custom_heart_botton.dart';
import '../../../../../Core/utiles/widgets/product_image.dart';
import '../../../../cart/presentation/controller/provider/cart_provider.dart';

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

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : InkWell(
            onTap: () {
              pushTo(
                context: context,
                screen: ProductDetails(
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
                        label: "${getCurrProduct.productPrice}\$",
                        fontSize: 21,
                      )),
                      Material(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.lightBlue,
                        child: InkWell(
                          splashColor: Colors.red,
                          borderRadius: BorderRadius.circular(16.0),
                          onTap: () {
                            cartProvider.addProductToCart(
                                productId: getCurrProduct.productId);
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
