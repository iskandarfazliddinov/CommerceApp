import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/forget_password/forget_password.dart';
import 'package:commerce_app/presentation/ui/screens/home/home_screen.dart';
import 'package:commerce_app/presentation/ui/screens/load/load_screen.dart';
import 'package:commerce_app/presentation/ui/screens/main/main_screen.dart';
import 'package:commerce_app/presentation/ui/screens/sign_up/sign_up.dart';
import 'package:commerce_app/presentation/ui/widgets/w_bottom_title.dart';
import 'package:commerce_app/presentation/ui/widgets/w_button.dart';
import 'package:commerce_app/presentation/ui/widgets/w_mainLogo.dart';
import 'package:commerce_app/presentation/ui/widgets/w_textFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const WMainLogo(
                  AppImages.logoMain, "Welcome Back", "Login to your account"),
              WTextFiled(false, controllerEmail, "Email address",
                  TextInputType.emailAddress),
              WTextFiled(true, controllerPassword, "Password",
                  TextInputType.visiblePassword),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const ForgetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Forget Password ?",
                          style: Styles.getTextNode(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              WButton(
                text: "Login",
                onTab: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoadScreen(),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  "Or",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: OutlinedButton.icon(
                      icon: Image.asset(
                        "assets/icons/google1.png",
                      ),
                      onPressed: () {},
                      label: const Text(
                        "Google",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: OutlinedButton.icon(
                      icon: Image.asset(
                        "assets/icons/facebook.png",
                      ),
                      onPressed: () {},
                      label: const Text(
                        "Facebook",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const WBottomTitle(
                  "SignUp", "Don’t have an account?  ", "Sign Up", true),
            ],
          ),
        ),
      ),
    );
  }
}
