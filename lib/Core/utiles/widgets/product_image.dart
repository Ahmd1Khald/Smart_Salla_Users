import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage(
      {Key? key,
      required this.image,
      required this.size,
      required this.borderR})
      : super(key: key);

  final String image;
  final double size;
  final double borderR;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderR),
      child: FancyShimmerImage(
        imageUrl: image,
        height: MediaQuery.of(context).size.height * size,
        width: MediaQuery.of(context).size.height * size,
      ),
    );
  }
}
