import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepeatPassTextField extends StatefulWidget {
  final TextEditingController passController2;
  final TextEditingController passController1;

  const RepeatPassTextField({
    super.key,
    required this.passController1,
    required this.passController2,
  });

  @override
  _RepeatPassTextFieldState createState() => _RepeatPassTextFieldState();
}

class _RepeatPassTextFieldState extends State<RepeatPassTextField> {
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
      controller: widget.passController1,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (widget.passController1 != widget.passController2) {
          return 'password not not compatible';
        }
        return null;
      },
    );
  }
}
