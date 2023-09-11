import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/widgets/my_app_method.dart';
import 'package:salla_users/Features/home/data/models/product_model.dart';
import 'package:salla_users/Features/home/presentation/controller/provider/product_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../../Core/utiles/constance/app_strings.dart';
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

  final userDB =
      FirebaseFirestore.instance.collection(AppStrings.usersCollection);
  Future<void> addProductToCartFirebase({
    required String productId,
    required int qty,
    required BuildContext context,
  }) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      MyAppMethods.showErrorORWarningDialog(
          context: context, subtitle: "No user found", fct: () {});
      return;
    }
    final uid = user.uid;
    final cartID = const Uuid().v4();
    try {
      userDB.doc(uid).update({
        "userCart": FieldValue.arrayUnion([
          {
            'cartID': cartID,
            'productID': productId,
            'quantity': qty,
          },
        ])
      });
      await fetchCart();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchCart() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      _cartItems.clear();
      return;
    }
    try {
      final userDoc = await userDB.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey("userCart")) {
        return;
      }
      final size = userDoc.get("userCart").length;
      for (int i = 0; i < size; i++) {
        _cartItems.putIfAbsent(
            userDoc.get("userCart")[i]['productID'],
            () => CartModel(
                  cartId: userDoc.get("userCart")[i]['cartID'],
                  productId: userDoc.get("userCart")[i]['productID'],
                  quantity: userDoc.get("userCart")[i]['quantity'],
                ));
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
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
