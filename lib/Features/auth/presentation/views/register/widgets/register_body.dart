import 'package:flutter/material.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/register_button.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/register_title.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/repeat_password_textfield.dart';

import '../../../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../../../Core/utiles/constance/text_styles/title_text.dart';
import '../../../../../../Core/utiles/widgets/email_textfield.dart';
import '../../../../../../Core/utiles/widgets/password_textfield.dart';
import 'name_textfield.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var repeatPassController = TextEditingController();
    var nameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 30, left: 30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PutUserImage(
                  //   image: RegisterCubit.get(context).userImage,
                  //   onPressed: () {
                  //     //RegisterCubit.get(context).setImage();
                  //   },
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  const RegisterTitle(
                    title: 'Register to get started !',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  NameTextField(
                    nameController: nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EmailTextField(emailController: emailController),
                  const SizedBox(
                    height: 20,
                  ),
                  PassTextField(
                    passController: passController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RepeatPassTextField(
                    passController1: repeatPassController,
                    passController2: passController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RegisterButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(nameController.text);
                          print(emailController.text);
                          print(passController.text);
                          print(repeatPassController.text);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TitlesTextWidget(
                        label: 'Do you have an account? ',
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const SubtitleTextWidget(
                          label: 'Sign Up',
                          color: Colors.blue,
                          textDecoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
