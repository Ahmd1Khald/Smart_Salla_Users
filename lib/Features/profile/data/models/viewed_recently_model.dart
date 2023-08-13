import 'package:flutter/material.dart';

class ViewedRecentlyModel with ChangeNotifier {
  final String cartId;
  final String productId;

  ViewedRecentlyModel({
    required this.cartId,
    required this.productId,
  });
}
