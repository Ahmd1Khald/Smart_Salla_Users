import 'package:flutter/material.dart';
import 'package:salla_users/Features/auth/presentation/views/widgets/background.dart';
import 'package:salla_users/Features/auth/presentation/views/widgets/main_contanir.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                BaskGroundWidget(),
                MainContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
