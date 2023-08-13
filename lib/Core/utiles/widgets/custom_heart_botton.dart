import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
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
          wishListProvider.addOrRemoveProductFromWishList(
            productId: widget.productId,
          );
        },
        icon: Icon(
          wishListProvider.isProductInWishList(productID: widget.productId)
              ? IconlyBold.heart
              : IconlyLight.heart,
          size: widget.size,
          color:
              wishListProvider.isProductInWishList(productID: widget.productId)
                  ? Colors.red
                  : widget.color,
        ),
      ),
    );
  }
}
