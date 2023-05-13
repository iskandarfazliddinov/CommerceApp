import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/add_address/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  TextEditingController controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
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
                            hintStyle: TextStyle(color: AppColors.black),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Container(
                          color: const Color(0xFFF13005),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 36.0),
                            child: Text(
                              "Delete Card",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
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
                            hintStyle: TextStyle(color: AppColors.black),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Container(
                          color: const Color(0xFFFFA305),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 36.0),
                            child: Text(
                              "+Add Card",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
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
                hintStyle: TextStyle(color: AppColors.black.withOpacity(0.8),),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 0.1),
                ),
                focusedBorder: OutlineInputBorder(
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
          "Payment Method",
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
          Center(
              child: Text(
            "Save",
            style: Styles.getTextActionStyles(),
          )),
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
