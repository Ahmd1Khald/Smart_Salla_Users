import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salla_users/Core/utiles/app_functions.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Features/auth/presentation/views/register/register_screen.dart';
import 'package:salla_users/Features/auth/presentation/views/widgets/register_title.dart';
import 'package:salla_users/Features/root_screens/presentaiton/views/root_screens.dart';

import '../../../../../Core/utiles/widgets/email_textfield.dart';
import '../../../../../Core/utiles/widgets/my_app_method.dart';
import '../../../../../Core/utiles/widgets/password_textfield.dart';
import '../../../../../Core/utiles/widgets/shadow.dart';
import 'login_button.dart';

class MainContainer extends StatefulWidget {
  MainContainer({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  bool isLoading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        boxShadow: [
          shadow(context),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const WelcomeTitle(),
              const SizedBox(
                height: 23,
              ),
              EmailTextField(emailController: widget.emailController),
              const SizedBox(
                height: 12,
              ),
              PassTextField(
                passController: widget.passController,
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {
                    AppFunction.pushTo(context, const RegisterScreen());
                  },
                  child: const SubtitleTextWidget(
                    label: 'Forget password?',
                    textDecoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginButton(
                onPressed: () async {
                  if (widget.formKey.currentState!.validate()) {
                    try {
                      setState(() {
                        isLoading = true;
                      });
                      if (isLoading == true) {
                        MyAppMethods.loadingPage(context: context);
                      }

                      await auth
                          .signInWithEmailAndPassword(
                            email: widget.emailController.text.trim(),
                            password: widget.passController.text.trim(),
                          )
                          .then((value) => AppFunction.pushAndRemove(
                              context, const RoutScreens()));
                      Fluttertoast.showToast(
                        msg: "Login Success!",
                        toastLength: Toast.LENGTH_SHORT,
                        textColor: Colors.white,
                      );
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
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                      if (isLoading == false) {
                        Navigator.pop(context);
                      }
                    }
                    print(widget.emailController.text.trim());
                    print(widget.passController.text.trim());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
