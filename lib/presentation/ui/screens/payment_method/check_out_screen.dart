import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/verification/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  TextEditingController controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0,left: 30.0,top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.card),
              const SizedBox(
                height: 40,
              ),
              _getFiled(title: "Card Holder Name", hints: "Saul Goodmate"),
              _getFiled(
                  title: "Card Number", hints: "0123   4567   8901   2345"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiry Date",
                        style: Styles.getLabelStyle().copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "09/28",
                            hintStyle: TextStyle(
                              color: AppColors.black
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.black, width: 0.1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.black, width: 0.1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CVV",
                        style: Styles.getLabelStyle().copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                       SizedBox(
                        width: 150,
                        child: TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "235",
                            hintStyle: TextStyle(
                              color: AppColors.black
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.black, width: 0.1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.black, width: 0.1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerificationScreen(),),);
                  },
                  child: Container(
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: Styles.getTextActionStyles()
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFiled({required String title, required String hints}) => Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.getLabelStyle().copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              maxLines: 1,
              controller: controllers,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: hints,
                hintStyle: TextStyle(
                  color: AppColors.black.withOpacity(0.8),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 0.1),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 0.1),
                ),
              ),
            ),
          ],
        ),
      );

  _getAppBar() => AppBar(
        title:  Center(
            child: Text(
          "Checkout",
          style: TextStyle(color: AppColors.black),
        )),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child:  Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
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
