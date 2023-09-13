import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';
import 'package:salla_users/Features/cart/data/model/cart_model.dart';

import '../../controller/provider/cart_provider.dart';

class QuantityBottomSheet extends StatelessWidget {
  const QuantityBottomSheet({Key? key, required this.model}) : super(key: key);

  final CartModel model;
  @override
  Widget build(BuildContext context) {
    print(model.quantity);
    print("+++++++++++");
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 12,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(16)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: model.quantity,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  print("index $index");

                  cartProvider.updateQuantity(
                    productId: model.productId,
                    quantity: index + 1,
                  );
                  Navigator.pop(context);
                },
                child: Center(
                  child: TitlesTextWidget(
                    label: "${index + 1}",
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
