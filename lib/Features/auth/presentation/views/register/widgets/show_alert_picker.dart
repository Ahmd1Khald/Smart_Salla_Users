import 'package:flutter/material.dart';

import '../../../../../../Core/utiles/constance/text_styles/title_text.dart';

Future<void> imagePickerDialog({
  required BuildContext context,
  required Function cameraFCT,
  required Function galleryFCT,
  required Function removeFCT,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(
          child: TitlesTextWidget(
            label: "Choose option",
          ),
        ),
        content: SingleChildScrollView(
            child: ListBody(
          children: [
            TextButton.icon(
              onPressed: () {
                cameraFCT();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.camera),
              label: const Text(
                "Camera",
              ),
            ),
            TextButton.icon(
              onPressed: () {
                galleryFCT();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.image),
              label: const Text(
                "Gallery",
              ),
            ),
            TextButton.icon(
              onPressed: () {
                removeFCT();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.remove),
              label: const Text(
                "Remove",
              ),
            ),
          ],
        )),
      );
    },
  );
}
