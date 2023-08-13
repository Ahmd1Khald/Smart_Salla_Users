import 'package:flutter/material.dart';

import '../constance/text_styles/subtitle_text.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.body,
      required this.buttonText,
      required this.image,
      required this.function})
      : super(key: key);

  final String title;
  final String subTitle;
  final String body;
  final String buttonText;
  final String image;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              child: Image.asset(
                image,
                height: size.height * 0.35,
                width: double.infinity,
              ),
            ),
            SubtitleTextWidget(
              label: title,
              color: Colors.orange,
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 30,
            ),
            SubtitleTextWidget(
              label: subTitle,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 20,
            ),
            SubtitleTextWidget(
              label: body,
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(17),
              ),
              onPressed: function,
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
