import 'package:flutter/material.dart';

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
  void dispose() {
    widget.emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: AppStyles.hintText,
      // cursorColor: AppColors.lightGrey,
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        // hintStyle: AppStyles.hintText,
        // focusColor: AppColors.lightGrey,
        // fillColor: AppColors.lightGrey,
        prefixIcon: Icon(
          Icons.email_outlined,
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
