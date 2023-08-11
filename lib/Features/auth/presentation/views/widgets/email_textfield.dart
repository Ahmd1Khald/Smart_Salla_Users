import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController emailController;
  const EmailTextField({
    super.key,
    required this.emailController,
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: AppStyles.hintText,
      // cursorColor: AppColors.lightGrey,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        // hintStyle: AppStyles.hintText,
        // focusColor: AppColors.lightGrey,
        // fillColor: AppColors.lightGrey,
        prefixIcon: Icon(
          IconlyLight.login,
        ),
      ),
      controller: widget.emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is too small';
        }
        return null;
      },
    );
  }
}
