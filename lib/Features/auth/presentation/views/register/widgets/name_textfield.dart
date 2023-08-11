import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({
    Key? key,
    required this.nameController,
  }) : super(key: key);
  final TextEditingController nameController;

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  @override
  void dispose() {
    widget.nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(
          FontAwesomeIcons.user,
        ),
        hintText: 'Enter your name',
      ),
      controller: widget.nameController,
      keyboardType: TextInputType.name,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is too small';
        }
        return null;
      },
    );
  }
}
