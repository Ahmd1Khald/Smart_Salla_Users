import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

import '../../../../../Core/utiles/constance/assets_images.dart';
import '../../../../../Core/utiles/constance/const_variable.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key, required this.function})
      : super(key: key);

  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.size(context).width * 0.4,
      child: MaterialButton(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        splashColor: Colors.blue,
        height: AppConst.size(context).width * 0.13,
        onPressed: function,
        child: Row(
          children: [
            const TitlesTextWidget(
              label: 'Sign in with  ',
              fontSize: 16,
              color: Colors.black,
            ),
            Image.asset(
              AssetsImages.googleIcon,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
