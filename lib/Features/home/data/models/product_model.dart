import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productId;
  final String productTitle;
  final String productPrice;
  final String productCategory;
  final String productDescription;
  final String productImage;
  final String productQuantity;

  ProductModel({
    required this.productDescription,
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productImage,
    required this.productQuantity,
  });
}
