import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/assets_images.dart';

import 'or line.dart';

class BaskGroundWidget extends StatelessWidget {
  const BaskGroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.32,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AssetsImages.loginCover,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.71,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(60),
              topLeft: Radius.circular(60),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              OrLine(),
            ],
          ),
        ),
      ],
    );
  }
}
