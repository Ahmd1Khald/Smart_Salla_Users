import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salla_users/Core/utiles/constance/assets_images.dart';
import 'package:salla_users/Features/auth/presentation/views/widgets/signin_google_button.dart';

import '../../../../../Core/utiles/app_functions.dart';
import '../../../../../Core/utiles/constance/app_strings.dart';
import '../../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../../Core/utiles/constance/text_styles/title_text.dart';
import '../../../../../Core/utiles/widgets/my_app_method.dart';
import '../../../../root_screens/presentaiton/views/root_screens.dart';
import '../register/register_screen.dart';
import 'guest_button.dart';
import 'or line.dart';

class BaskGroundWidget extends StatefulWidget {
  const BaskGroundWidget({Key? key}) : super(key: key);

  @override
  State<BaskGroundWidget> createState() => _BaskGroundWidgetState();
}

class _BaskGroundWidgetState extends State<BaskGroundWidget> {
  final GoogleSignIn gSignIn = GoogleSignIn();

  Future<void> googleSignIn() async {
    MyAppMethods.loadingPage(context: context);
    try {
      // Start the Google Sign-In process
      final GoogleSignInAccount? account = await gSignIn.signIn();

      if (account != null) {
        // Retrieve the authentication token
        final GoogleSignInAuthentication authentication =
            await account.authentication;

        // Use the token to sign in to your Firebase backend
        // For example:
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken,
        );
        final authResult =
            await FirebaseAuth.instance.signInWithCredential(authCredential);

        if (authResult.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection(AppStrings.usersCollection)
              .doc(authResult.user!.uid)
              .set({
            'userId': authResult.user!.uid,
            'userName': authResult.user!.displayName,
            'userImage': authResult.user!.photoURL,
            'userEmail': authResult.user!.email,
            'createdAt': Timestamp.now(),
            'userCart': [],
            'userWishlist': [],
          }).then((value) =>
                  AppFunction.pushAndRemove(context, const RoutScreens()));
        }
        await FirebaseAuth.instance.signInWithCredential(authCredential).then(
            (value) => AppFunction.pushAndRemove(context, const RoutScreens()));

        // If sign-in is successful, proceed with the rest of your logic
        // ...
      } else {
        Fluttertoast.showToast(
          msg: "Google Sign-In canceled",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
        );
        // User canceled the sign-in process
        print('Google Sign-In canceled by user');
      }
    } on FirebaseAuthException catch (error) {
      await MyAppMethods.showErrorORWarningDialog(
        context: context,
        subtitle: "An error has been occured ${error.message}",
        fct: () {
          Navigator.pop(context);
        },
      );
    } catch (error) {
      await MyAppMethods.showErrorORWarningDialog(
        context: context,
        subtitle: "An error has been occured $error",
        fct: () {
          Navigator.pop(context);
        },
      );
    }
  }

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
                    function: () async {
                      await googleSignIn();
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  GuestButton(
                    function: () {
                      AppFunction.pushAndRemove(context, const RoutScreens());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
                      AppFunction.pushTo(context, const RegisterScreen());
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
