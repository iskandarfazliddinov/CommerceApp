import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/widgets/w_button.dart';
import 'package:commerce_app/presentation/ui/widgets/w_mainLogo.dart';
import 'package:commerce_app/presentation/ui/widgets/w_textFiled.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WMainLogo(AppImages.logoMain, "Reset", "Reset your password"),
            SizedBox(height:screenHeight*0.1 ,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Enter Your New Password",
                style: Styles.getNodeTitle(),
              ),
            ),
            WTextFiled(true, controllerPassword, "NewPassword", TextInputType.visiblePassword),
            WTextFiled(true, controllerConfirmPassword, "Confirm Password", TextInputType.visiblePassword),
            SizedBox(height: screenHeight*0.26,),
            WButton(text:"Change Password", onTab: () {  },),
          ],
        ),
      ),
    ));
  }
}
