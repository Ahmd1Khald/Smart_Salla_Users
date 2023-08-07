import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key, required this.function}) : super(key: key);

  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
        onPressed: function,
        icon: const Icon(Icons.login),
        label: const Text(
          "Login",
        ),
      ),
    );
  }
}
