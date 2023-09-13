import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../Core/utiles/constance/app_strings.dart';
import '../../../../../Core/utiles/widgets/my_app_method.dart';
import '../../../data/models/wish_list_model.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishListModel> _wishLists = {};

  Map<String, WishListModel> get getWishList {
    return _wishLists;
  }

  final userDB =
      FirebaseFirestore.instance.collection(AppStrings.usersCollection);

  Future<void> removeWishListItemFromFirebase({
    required String wishlistId,
    required String productId,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      print("removeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      await userDB.doc(user!.uid).update({
        "userWishlist": FieldValue.arrayRemove([
          {
            "wishlistID": wishlistId,
            'productID': productId,
          }
        ])
      });
      _wishLists.remove(productId);
      await fetchWishlist();
    } catch (e) {
      print(e);
      rethrow;
    }
    notifyListeners();
  }

  Future<void> clearCartFromFirebase() async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      await userDB.doc(user!.uid).update({"userWishlist": []});
      _wishLists.clear();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> addProductToWishListFirebase({
    required String productId,
    required BuildContext context,
  }) async {
    print("adddddddddddddddddddddddddddddd");
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      MyAppMethods.showErrorORWarningDialog(
          context: context, subtitle: "No user found", fct: () {});
      return;
    }
    final uid = user.uid;
    final wishlistId = const Uuid().v4();
    try {
      userDB.doc(uid).update({
        "userWishlist": FieldValue.arrayUnion([
          {
            'wishlistID': wishlistId,
            'productID': productId,
          },
        ])
      });
      await fetchWishlist();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchWishlist() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      _wishLists.clear();
      return;
    }
    try {
      final userDoc = await userDB.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey("userWishlist")) {
        return;
      }
      final size = userDoc.get("userWishlist").length;
      for (int i = 0; i < size; i++) {
        _wishLists.putIfAbsent(
            userDoc.get("userWishlist")[i]['productID'],
            () => WishListModel(
                  wishlistId: userDoc.get("userWishlist")[i]['wishlistID'],
                  productId: userDoc.get("userWishlist")[i]['productID'],
                ));
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  bool isProductInWishList({required String productID}) {
    return _wishLists.containsKey(productID);
  }

  void addOrRemoveProductFromWishList({required String productId}) {
    if (_wishLists.containsKey(productId)) {
      _wishLists.remove(productId);
    } else {
      _wishLists.putIfAbsent(
        productId,
        () => WishListModel(
          wishlistId: const Uuid().v4(),
          productId: productId,
        ),
      );
    }
    notifyListeners();
  }

  void clearWishListItems() {
    _wishLists.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _wishLists.remove(productId);
    notifyListeners();
  }
}
