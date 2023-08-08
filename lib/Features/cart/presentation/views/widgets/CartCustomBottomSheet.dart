import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: const Border(top: BorderSide(width: 1, color: Colors.grey))),
      height: kBottomNavigationBarHeight + 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlesTextWidget(label: 'Total (6 product/6 items)'),
                  SubtitleTextWidget(
                    label: '16.99\$',
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            )
          ],
        ),
      ),
    );
  }
}
