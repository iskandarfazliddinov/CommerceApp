import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController controller = TextEditingController(text: "*");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          SvgPicture.asset(AppImages.smsIcon),
          const SizedBox(
            height: 30,
          ),
          Text(
            "OTP Verification",
            style: Styles.getLabelStyle().copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            "We have sent OTP on your number",
            style: Styles.getLabelStyle().copyWith(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(4, (index) => Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SizedBox(
                    height: 55,
                    width: 55,
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700
                        ),
                        controller: controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightGray,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Don’t receive a OTP? ",
              style: Styles.getOnBoardingTitle().copyWith(fontSize: 16),
              children: <TextSpan>[
                TextSpan(
                  text: "Resend OTP",
                  style: Styles.getTextActionStyles().copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getAppBar() => AppBar(
        title: const Center(
            child: Text(
          "Checkout",
          style: TextStyle(color: Colors.black),
        )),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          SvgPicture.asset(AppIcons.wishlist),
          const SizedBox(
            width: 16,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 1),
          child: Container(
            color: const Color(0xFFDEDEDE),
            height: 1,
          ),
        ),
      );
}
