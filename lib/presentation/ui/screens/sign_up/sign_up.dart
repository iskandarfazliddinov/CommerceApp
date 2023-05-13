import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/screens/load/load_screen.dart';
import 'package:commerce_app/presentation/ui/widgets/w_bottom_title.dart';
import 'package:commerce_app/presentation/ui/widgets/w_button.dart';
import 'package:commerce_app/presentation/ui/widgets/w_mainLogo.dart';
import 'package:commerce_app/presentation/ui/widgets/w_textFiled.dart';
import 'package:flutter/material.dart';

import '../main/main_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPhoneNumber = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    TextEditingController controllerConPassword = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WMainLogo(
                  AppImages.logoMain, "Register", "Create new account"),
              WTextFiled(false, controllerEmail, "Email address",
                  TextInputType.emailAddress),
              WTextFiled(false, controllerPhoneNumber, "Phone number",
                  TextInputType.number),
              WTextFiled(true, controllerPassword, "Password",
                  TextInputType.visiblePassword),
              WTextFiled(false, controllerConPassword, "Confirm password",
                  TextInputType.visiblePassword),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: const [
                    WBottomTitle("", "By signing below, you agree to the ",
                        "Team of use", false),
                    WBottomTitle("", "and ", "privacy notice", false),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: WButton(
                  text: "Sign Up",
                  onTab: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoadScreen(),
                      ),
                    );
                  },
                ),
              ),
              const WBottomTitle(
                  "Login", "Already have an account? ", "Login", true),
            ],
          ),
        ),
      ),
    );
  }
}
