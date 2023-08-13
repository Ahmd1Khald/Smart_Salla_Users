import 'package:flutter/material.dart';
import 'package:salla_users/Features/home/data/models/product_model.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../data/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCart {
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

  void updateQuantity({required String productId, required int quantity}) {
    _cartItems.update(
      productId,
      (item) => CartModel(
        cartId: item.cartId,
        productId: productId,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }

  double getTotal({required ProductProvider productProvider}) {
    double total = 0;
    _cartItems.forEach((key, value) {
      final ProductModel? getCurrentPro =
          productProvider.findProductId(proId: value.productId);

      if (getCurrentPro == null) {
      } else {
        total += double.parse(getCurrentPro.productPrice) * value.quantity;
      }
    });
    return total;
  }

  void clearCartItems() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  int getCartItems() {
    int items = 0;
    _cartItems.forEach((key, value) {
      items += value.quantity;
    });
    return items;
  }
}
