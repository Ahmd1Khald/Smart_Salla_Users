import 'package:flutter/material.dart';

import '../../../../../Core/utiles/constance/const_variable.dart';
import '../../../../../Core/utiles/constance/text_styles/title_text.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({Key? key, required this.function}) : super(key: key);

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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitlesTextWidget(
              label: 'Guest ?',
              color: Colors.black,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
