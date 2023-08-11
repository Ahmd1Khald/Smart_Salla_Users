import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

class OrLine extends StatelessWidget {
  const OrLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 0.3,
          color: Colors.grey,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TitlesTextWidget(
            label: 'OR',
            color: Colors.grey,
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 0.3,
          color: Colors.grey,
        ),
      ],
    );
  }
}
