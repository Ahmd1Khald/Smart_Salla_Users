import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../data/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCartItem {
    return _cartItems;
  }

  bool isProductInCart({
    required String productID,
  }) {
    return _cartItems.containsKey(productID);
  }

  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
        cartId: const Uuid().v4(),
        productId: productId,
        quantity: 1,
      ),
    );
    notifyListeners();
  }
}
