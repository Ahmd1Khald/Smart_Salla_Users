import 'package:flutter/material.dart';
import 'package:salla_users/Core/utiles/constance/text_styles/subtitle_text.dart';
import 'package:salla_users/Features/auth/presentation/views/widgets/register_title.dart';

import '../../../../../Core/utiles/widgets/email_textfield.dart';
import '../../../../../Core/utiles/widgets/password_textfield.dart';
import '../../../../../Core/utiles/widgets/shadow.dart';
import 'login_button.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        boxShadow: [
          shadow(),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const WelcomeTitle(),
              const SizedBox(
                height: 23,
              ),
              EmailTextField(emailController: emailController),
              const SizedBox(
                height: 12,
              ),
              PassTextField(
                passController: passController,
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {},
                  child: const SubtitleTextWidget(
                    label: 'Forget password?',
                    textDecoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              LoginButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(emailController.text);
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
