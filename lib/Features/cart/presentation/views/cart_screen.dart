import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/app_functions.dart';
import 'package:salla_users/Features/cart/presentation/controller/provider/cart_provider.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/cart_widget.dart';
import 'package:salla_users/Features/cart/presentation/views/widgets/checkout_bottom_sheet.dart';
import 'package:salla_users/Features/root_screens/presentaiton/views/root_screens.dart';
import 'package:uuid/uuid.dart';

import '../../../../Core/utiles/constance/app_strings.dart';
import '../../../../Core/utiles/constance/assets_images.dart';
import '../../../../Core/utiles/widgets/alert_widget.dart';
import '../../../../Core/utiles/widgets/custom_app_bar.dart';
import '../../../../Core/utiles/widgets/empty_cart.dart';
import '../../../../Core/utiles/widgets/my_app_method.dart';
import '../../../home/presentation/controller/provider/product_provider.dart';
import '../../../home/presentation/controller/provider/user_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    //final cartModelProvider = Provider.of<CartModel>(context);
    return cartProvider.getCart.isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
              title: AppStrings.whoopsCartString,
              subTitle: AppStrings.cartEmptyString,
              body: AppStrings.looksLikeCartString,
              buttonText: AppStrings.shopNowString,
              image: AssetsImages.bagWish,
              function: () {
                AppFunction.pushAndRemove(context, const RoutScreens());
              },
            ),
          )
        : Scaffold(
            bottomSheet: CartBottomSheet(func: () async {
              await placeOrder(
                cartProvider: cartProvider,
                productProvider: productProvider,
                userProvider: userProvider,
              );
            }),
            appBar: customAppBar(
              [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertWidget(
                              title: 'Remove all cart ?',
                              subTitle1: 'Cancel',
                              subTitle2: 'Yes',
                              func1: () {
                                Navigator.pop(context);
                              },
                              func2: () async {
                                await cartProvider.clearCartFromFirebase();
                                Navigator.pop(context);
                              },
                            ));
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                    size: 28,
                  ),
                )
              ],
              title: AppStrings.shoppingBasketString,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                      value: cartProvider.getCart.values
                          .toList()
                          .reversed
                          .toList()[index],
                      child: const CartWidget(),
                    ),
                    itemCount: cartProvider.getCart.length,
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                )
              ],
            ),
          );
  }

  Future<void> placeOrder({
    required CartProvider cartProvider,
    required ProductProvider productProvider,
    required UserProvider userProvider,
  }) async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return;
    }
    final uid = user.uid;
    try {
      setState(() {
        isLoading = true;
      });
      cartProvider.getCart.forEach((key, value) async {
        final getCurrProduct =
            productProvider.findProductId(proId: value.productId);
        print(getCurrProduct!.productTitle);
        print("++++++++++");
        final orderId = const Uuid().v4();
        await FirebaseFirestore.instance
            .collection(AppStrings.ordersCollection)
            .doc(orderId)
            .set({
          'orderId': orderId,
          'userId': uid,
          'productId': value.productId,
          "productTitle": getCurrProduct.productTitle ?? "No productTitle",
          'price': double.parse(getCurrProduct.productPrice) * value.quantity,
          'totalPrice': cartProvider.getTotal(productProvider: productProvider),
          'quantity': value.quantity,
          'imageUrl': getCurrProduct.productImage,
          'userName': userProvider.getUserModel?.userName,
          'orderDate': Timestamp.now(),
        });
        MyAppMethods.uploadedSuccess(
            context: context,
            function: () async {
              await cartProvider.clearCartFromFirebase();
              cartProvider.clearCartItems();
            });
      });
    } catch (e) {
      MyAppMethods.showErrorORWarningDialog(
        context: context,
        subtitle: e.toString(),
        fct: () {},
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
