import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../Core/utiles/constance/text_styles/title_text.dart';
import '../../../../Core/utiles/widgets/app_name.dart';
import '../../../../Core/utiles/widgets/custom_heart_botton.dart';
import '../../../cart/presentation/controller/provider/cart_provider.dart';
import '../controller/provider/product_provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    //print(ModalRoute.of(context)!.settings.arguments);
    //print('ModalRoute.of(context)!.settings.arguments');
    //final productId = ModalRoute.of(context)!.settings.arguments as String;

    final getCurrProduct =
        productProvider.findProductId(proId: widget.productId);

    final cartProvider = Provider.of<CartProvider>(context);

    print(widget.productId);
    print('+++++++++++++++');

    return Scaffold(
      appBar: AppBar(
        title: const AppName(),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.grey[600],
          ),
        ),
        // automaticallyImplyLeading: false,
      ),
      body: getCurrProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: getCurrProduct.productImage,
                    height: size.height * 0.38,
                    width: double.infinity,
                    boxFit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              // flex: 5,
                              child: Text(
                                getCurrProduct.productTitle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            SubtitleTextWidget(
                              label: '${getCurrProduct.productPrice}\$',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.lightBlue,
                                child: InkWell(
                                  splashColor: Colors.red,
                                  borderRadius: BorderRadius.circular(16.0),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: HeartButtonWidget(
                                      productId: getCurrProduct.productId,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight - 10,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      cartProvider.addProductToCart(
                                          productId: getCurrProduct.productId);
                                    },
                                    icon: Icon(cartProvider.isProductInCart(
                                            productID: getCurrProduct.productId)
                                        ? Icons.check
                                        : Icons.add_shopping_cart_rounded),
                                    label: Text(
                                      cartProvider.isProductInCart(
                                              productID:
                                                  getCurrProduct.productId)
                                          ? "Added"
                                          : "Add to cart",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TitlesTextWidget(label: "About this item"),
                            SubtitleTextWidget(
                                label: 'In ${getCurrProduct.productCategory}')
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SubtitleTextWidget(
                          label: getCurrProduct.productDescription,
                          maxLines: 200,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
