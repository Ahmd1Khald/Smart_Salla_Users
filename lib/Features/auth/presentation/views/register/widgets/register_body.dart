import 'package:flutter/material.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/register_button.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/register_title.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/repeat_password_textfield.dart';

import '../../../../../../Core/utiles/constance/text_styles/subtitle_text.dart';
import '../../../../../../Core/utiles/constance/text_styles/title_text.dart';
import 'email_textfield.dart';
import 'name_textfield.dart';
import 'password_textfield.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, right: 30, left: 30),
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
                      title: 'Register to get started!',
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
                        passController2: passController),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: RegisterButton(
                        onPressed: () {},
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
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
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
            ),
          ),
        ),
      ),
    );
  }
}
