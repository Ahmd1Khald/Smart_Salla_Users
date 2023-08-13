import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/viewed_recently_model.dart';

class ViewedRecentlyProvider with ChangeNotifier {
  final Map<String, ViewedRecentlyModel> _viewedRecently = {};

  Map<String, ViewedRecentlyModel> get getViewedRecently {
    return _viewedRecently;
  }

  void addProductToViewedRecently({required String productId}) {
    _viewedRecently.putIfAbsent(
      productId,
      () => ViewedRecentlyModel(
        cartId: const Uuid().v4(),
        productId: productId,
      ),
    );
    notifyListeners();
  }

  void clearViewedRecentlyItems() {
    _viewedRecently.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _viewedRecently.remove(productId);
    notifyListeners();
  }
}
