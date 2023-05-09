import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/widgets/w_button.dart';
import 'package:commerce_app/presentation/ui/widgets/w_mainLogo.dart';
import 'package:commerce_app/presentation/ui/widgets/w_textFiled.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WMainLogo(AppImages.logoMain, "Forget", "Forget your password"),
              SizedBox(
                height: screenHeight * 0.12,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 20),
                child: Text(
                  "Please enter your email address below\nyou will receive a link to create a new\npassword via email",
                  style: Styles.getNodeTitle(),
                ),
              ),
              WTextFiled(false, controllerEmail, "Email address", TextInputType.emailAddress),
              SizedBox(height: screenHeight*0.24,),
              WButton(text: 'Continue', onTab: () {  },),
            ],
          ),
        ),
      ),
    );
  }
}
