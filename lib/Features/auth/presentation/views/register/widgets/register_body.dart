import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salla_users/Core/utiles/constance/const_variable.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/register_button.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/register_title.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/repeat_password_textfield.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/show_alert_picker.dart';
import 'package:salla_users/Features/auth/presentation/views/register/widgets/sign_up.dart';
import 'package:salla_users/Features/root_screens/presentaiton/views/root_screens.dart';

import '../../../../../../Core/utiles/app_functions.dart';
import '../../../../../../Core/utiles/constance/app_strings.dart';
import '../../../../../../Core/utiles/widgets/email_textfield.dart';
import '../../../../../../Core/utiles/widgets/my_app_method.dart';
import '../../../../../../Core/utiles/widgets/password_textfield.dart';
import '../../../../../../Core/utiles/widgets/pick_image_widget.dart';
import 'name_textfield.dart';

class RegisterBody extends StatefulWidget {
  RegisterBody({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var repeatPassController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? userReturnedUrl;
  XFile? pickedImage;
  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  //bool isLoading = false;
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    widget.nameController.dispose();
    widget.emailController.dispose();
    widget.passController.dispose();
    widget.repeatPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("++++++++++++++++++");
    print(widget.pickedImage);
    Future<void> localImagePicker() async {
      final ImagePicker picker = ImagePicker();
      await imagePickerDialog(
        context: context,
        cameraFCT: () async {
          widget.pickedImage =
              await picker.pickImage(source: ImageSource.camera);
          setState(() {});
          await uploadUserImageAndGiveLink(context);
        },
        galleryFCT: () async {
          widget.pickedImage =
              await picker.pickImage(source: ImageSource.gallery);
          setState(() {});
          print("++++++++++++++++++");
          print(widget.pickedImage);
        },
        removeFCT: () {
          setState(() {
            widget.pickedImage = null;
          });
        },
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
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
                    height: AppConst.size(context).width * 0.3,
                    width: AppConst.size(context).width * 0.3,
                    child: PickImageWidget(
                      pickedImage: widget.pickedImage,
                      function: () async {
                        await localImagePicker();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                NameTextField(
                  nameController: widget.nameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                EmailTextField(emailController: widget.emailController),
                const SizedBox(
                  height: 20,
                ),
                PassTextField(
                  passController: widget.passController,
                ),
                const SizedBox(
                  height: 20,
                ),
                RepeatPassTextField(
                  passController1: widget.repeatPassController,
                  passController2: widget.passController,
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: RegisterButton(
                    onPressed: () async {
                      //MyAppMethods.loadingPage(context: context);
                      if (widget.formKey.currentState!.validate()) {
                        if (widget.pickedImage == null) {
                          print('+++++++++++++++++++++++++');
                          MyAppMethods.showErrorORWarningDialog(
                            context: context,
                            subtitle: "Make sure to pick up an image",
                            fct: () {
                              //Navigator.pop(context);
                            },
                          );
                        } else {
                          try {
                            await auth.createUserWithEmailAndPassword(
                              email: widget.emailController.text.trim(),
                              password: widget.passController.text.trim(),
                            );

                            await addDataToFirestore().then((value) {
                              Fluttertoast.showToast(
                                msg: "An account has been created",
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                              );
                              AppFunction.pushAndRemove(
                                  context, const RoutScreens());
                            });
                            //Navigator.pop(context);
                            //Navigator.pop(context);
                          } on FirebaseAuthException catch (error) {
                            await MyAppMethods.showErrorORWarningDialog(
                              context: context,
                              subtitle:
                                  "An error has been occured ${error.message}",
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
                          print(widget.nameController.text.trim());
                          print(widget.emailController.text.trim());
                          print(widget.passController.text.trim());
                          print(widget.repeatPassController.text.trim());
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                SignInWidget(
                  function: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addDataToFirestore() async {
    User? user = auth.currentUser;
    uploadUserImageAndGiveLink(context).then((value) async {
      await FirebaseFirestore.instance
          .collection(AppStrings.usersCollection)
          .doc(user!.uid)
          .set({
        'userId': user.uid,
        'userName': widget.nameController.text,
        'userImage': widget.userReturnedUrl,
        'userEmail': widget.emailController.text.toLowerCase(),
        'createdAt': Timestamp.now(),
        'userCart': [],
        'userWishlist': [],
      });
    });
  }

  Future<void> uploadUserImageAndGiveLink(
    BuildContext context,
  ) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('users_images')
        .child("${widget.emailController.text.trim()}.jpg");

    await ref.putFile(File(widget.pickedImage!.path)).then((p0) async {
      await ref.getDownloadURL().then((url) {
        widget.userReturnedUrl = url;
        print(widget.userReturnedUrl ?? "No url found");
      });
    });
  }
}
