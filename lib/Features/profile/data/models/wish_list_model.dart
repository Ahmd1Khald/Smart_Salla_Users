import 'package:flutter/material.dart';

class WishListModel with ChangeNotifier {
  final String cartId;
  final String productId;

  WishListModel({
    required this.cartId,
    required this.productId,
  });
}
