import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salla_users/Core/utiles/constance/const_variable.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/register_button.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/register_title.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/repeat_password_textfield.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/show_alert_picker.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/sign_up.dart';

import '../../../../../../Core/utiles/widgets/email_textfield.dart';
import '../../../../../../Core/utiles/widgets/password_textfield.dart';
import '../../../../../../Core/utiles/widgets/pick_image_widget.dart';
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
    XFile? pickedImage;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const RegisterTitle(
                  title: 'Register to get started !',
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: SizedBox(
                    height: AppConst.size(context).width * 0.33,
                    width: AppConst.size(context).width * 0.33,
                    child: PickImageWidget(
                      pickedImage: pickedImage,
                      function: () {
                        imagePickerDialog(
                          context: context,
                          cameraFCT: () {},
                          galleryFCT: () {},
                          removeFCT: () {},
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      SignUpWidget(
                        function: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
