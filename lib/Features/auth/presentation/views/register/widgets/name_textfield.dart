import 'package:flutter/material.dart';

class NameTextField extends StatefulWidget {
  final TextEditingController nameController;
  const NameTextField({
    super.key,
    required this.nameController,
  });

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
      // style: AppStyles.hintText,
      // cursorColor: AppColors.lightGrey,
      decoration: const InputDecoration(
        hintText: 'Enter your name',
        // hintStyle: AppStyles.hintText,
        // focusColor: AppColors.lightGrey,
        // fillColor: AppColors.lightGrey,
        prefixIcon: Icon(
          Icons.person_2_outlined,
        ),
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
