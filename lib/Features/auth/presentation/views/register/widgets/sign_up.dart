import 'package:flutter/material.dart';

import '../../../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../../../Core/utiles/constance/text_styles/title_text.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key, required this.function}) : super(key: key);

  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TitlesTextWidget(
          label: 'Do you have an account? ',
          color: Colors.blue,
          fontSize: 16,
        ),
        TextButton(
          onPressed: function,
          child: const SubtitleTextWidget(
            label: 'Sign Up',
            color: Colors.blue,
            textDecoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }
}
