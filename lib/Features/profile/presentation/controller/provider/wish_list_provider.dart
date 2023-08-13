import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/wish_list_model.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishListModel> _wishLists = {};

  Map<String, WishListModel> get getWishList {
    return _wishLists;
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
          cartId: const Uuid().v4(),
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
