import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/widgets/my_app_method.dart';
import 'package:salla_users/Features/profile/presentation/controller/provider/wish_list_provider.dart';

class HeartButtonWidget extends StatefulWidget {
  const HeartButtonWidget({
    super.key,
    this.size = 22,
    this.color = Colors.grey,
    required this.productId,
  });

  final double size;
  final Color color;
  final String productId;

  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
        onPressed: () {
          // wishListProvider.addOrRemoveProductFromWishList(
          //   productId: widget.productId,
          // );
          try {
            setState(() {
              isLoading = true;
            });
            if (wishListProvider.getWishList.containsKey(widget.productId)) {
              wishListProvider.removeWishListItemFromFirebase(
                wishlistId:
                    wishListProvider.getWishList[widget.productId]!.wishlistId,
                productId: widget.productId,
              );
            } else {
              wishListProvider.addProductToWishListFirebase(
                productId: widget.productId,
                context: context,
              );
            }
          } on FirebaseException catch (error) {
            MyAppMethods.showErrorORWarningDialog(
                context: context,
                subtitle: "Error occurred $error",
                fct: () {});
          } catch (error) {
            print(error);
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        },
        icon: !isLoading
            ? Icon(
                wishListProvider.isProductInWishList(
                        productID: widget.productId)
                    ? IconlyBold.heart
                    : IconlyLight.heart,
                size: widget.size,
                color: wishListProvider.isProductInWishList(
                        productID: widget.productId)
                    ? Colors.red
                    : widget.color,
              )
            : const CircularProgressIndicator(
                color: Colors.red,
              ),
      ),
    );
  }
}
