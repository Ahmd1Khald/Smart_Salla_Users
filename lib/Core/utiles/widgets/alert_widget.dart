import 'package:flutter/material.dart';

import '../constance/assets_images.dart';
import '../constance/const_variable.dart';
import '../constance/text_styles/subtitle_text.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget(
      {Key? key,
      required this.title,
      required this.subTitle1,
      required this.subTitle2,
      required this.func1,
      required this.func2})
      : super(key: key);

  final String title;
  final String subTitle1;
  final String subTitle2;

  final VoidCallback func1;
  final VoidCallback func2;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: SizedBox(
        height: AppConst.size(context).height * 0.25,
        child: Column(
          children: [
            Image.asset(
              AssetsImages.warning,
              width: 70,
            ),
            SizedBox(
              height: AppConst.size(context).height * 0.03,
            ),
            SubtitleTextWidget(
              label: title,
              fontSize: 17,
            ),
            SizedBox(
              height: AppConst.size(context).height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: func1,
                  child: SubtitleTextWidget(
                    label: subTitle1,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: func2,
                  child: SubtitleTextWidget(
                    label: subTitle2,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
