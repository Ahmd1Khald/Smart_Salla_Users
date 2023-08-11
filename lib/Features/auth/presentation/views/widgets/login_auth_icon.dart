import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/assets_images.dart';

import '../../../../../Core/utiles/widgets/shadow.dart';

class LoginIcons extends StatelessWidget {
  const LoginIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50.0,
        horizontal: 70,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              ///Todo auth with google
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  shadow(),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                // You can customize the background color of the circle avatar
                child: Image.asset(
                  AssetsImages.googleIcon,
                  height: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
