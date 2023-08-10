import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../Core/utiles/constance/text_styles/title_text.dart';
import '../../../../Core/utiles/widgets/app_name.dart';
import '../../../../Core/utiles/widgets/custom_heart_botton.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

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
      body: Column(
        children: [
          FancyShimmerImage(
            imageUrl: 'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
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
                        "Title " * 16,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    const SubtitleTextWidget(
                      label: "166.5\$",
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
                      const HeartButtonWidget(),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitlesTextWidget(label: "About this item"),
                    SubtitleTextWidget(label: "In Phones")
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SubtitleTextWidget(label: "description " * 15),
              ],
            ),
          )
        ],
      ),
    );
  }
}
