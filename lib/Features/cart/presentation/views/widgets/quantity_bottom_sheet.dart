import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

class QuantityBottomSheet extends StatelessWidget {
  const QuantityBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            itemCount: 40,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print(index);
                },
                child: Center(
                  child: TitlesTextWidget(
                    label: index.toString(),
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
