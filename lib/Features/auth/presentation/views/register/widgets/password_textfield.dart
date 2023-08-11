import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PassTextField extends StatefulWidget {
  final TextEditingController passController;

  const PassTextField({
    super.key,
    required this.passController,
  });

  @override
  _PassTextFieldState createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: AppStyles.hintText,
      // cursorColor: AppColors.lightGrey,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          IconlyLight.lock,
        ),
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
            size: 22,
          ),
          onPressed: _toggle,
        ),
      ),
      controller: widget.passController,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'password is too small';
        }
        return null;
      },
    );
  }
}
