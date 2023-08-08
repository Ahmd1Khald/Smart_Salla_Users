import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: FancyShimmerImage(
        imageUrl: image,
        height: size.height * 0.2,
        width: size.height * 0.2,
      ),
    );
  }
}
