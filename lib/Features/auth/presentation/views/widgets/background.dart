import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/assets_images.dart';
import 'package:salla_users/Features/auth/presentation/views/widgets/signin_google_button.dart';

import '../../../../../Core/root_manager.dart';
import '../../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../../Core/utiles/constance/text_styles/title_text.dart';
import 'guest_button.dart';
import 'or line.dart';

class BaskGroundWidget extends StatelessWidget {
  const BaskGroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
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
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: buildBoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.44,
              ),
              const OrLine(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GoogleSignInButton(
                    function: () {},
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  GuestButton(
                    function: () {},
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitlesTextWidget(
                    label: 'Don\'t have an account? ',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerRoute);
                    },
                    child: const SubtitleTextWidget(
                      label: 'Sign Up',
                      color: Colors.white,
                      textDecoration: TextDecoration.underline,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(60),
        topLeft: Radius.circular(60),
      ),
    );
  }
}
