import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:salla_users/Features/home/data/models/product_model.dart';

import '../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../Core/utiles/constance/text_styles/title_text.dart';
import '../../../../Core/utiles/widgets/app_name.dart';
import '../../../../Core/utiles/widgets/custom_heart_botton.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.model});

  final ProductModel model;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: widget.model.productImage,
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
                          widget.model.productTitle,
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
                        label: widget.model.productPrice,
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
                            child: const Padding(
                              padding: EdgeInsets.all(1.5),
                              child: HeartButtonWidget(),
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
                              onPressed: () {},
                              icon: const Icon(Icons.add_shopping_cart),
                              label: const Text(
                                "Add to cart",
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
                      SubtitleTextWidget(label: widget.model.productCategory)
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SubtitleTextWidget(
                    label: widget.model.productDescription,
                    maxLines: 10,
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
