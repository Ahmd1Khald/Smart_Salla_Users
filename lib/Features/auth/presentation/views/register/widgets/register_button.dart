import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/title_text.dart';

import '../../../../../../Core/utiles/constance/app_color.dart';
import '../../../../../../Core/utiles/constance/const_variable.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton({
    Key? key,
    formKey,
    required this.onPressed,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: AppConst.size(context).width * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.colorGradient1,
            AppColors.lineColor
            //ColorManager.colorGradient3,
            //ColorManager.colorGradient2,
          ],
        ),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        height: AppConst.size(context).width * 0.13,
        splashColor: Colors.blue,
        onPressed: onPressed,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitlesTextWidget(
              label: 'Sign up',
              color: Colors.white,
            ),
            Icon(
              IconlyLight.login,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
