import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/add_address/add_address_screen.dart';
import 'package:commerce_app/presentation/ui/screens/delivery_information/delivery_screen.dart';
import 'package:commerce_app/presentation/ui/screens/payment_method/payment_method_screen.dart';
import 'package:commerce_app/presentation/ui/screens/payment_method/payment_select.dart';
import 'package:flutter/material.dart';

import '../edit_profile/edit_screen.dart';


class DeliveryInfoScreen extends StatefulWidget {
  const DeliveryInfoScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryInfoScreen> createState() => _DeliveryInfoScreenState();
}

class _DeliveryInfoScreenState extends State<DeliveryInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Default Address :",
                    style: Styles.getLabelStyle().copyWith(fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DeliveryScreen(),),);
                    },
                    child: Text(
                      "Change",
                      style: Styles.getTextActionStyles(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _getStack(
                    subTitle: "Saul Goodmate",
                    textTitle:
                    "16 E Birch Hill Road\nFairbanks, NY, 99312\nUnited States\n\n865-5585 57587",),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAddressScreen(),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGray,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              color: AppColors.lightGray,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Add",
                              style: Styles.getContentStyle(),
                            ),
                            Text(
                              "Address",
                              style: Styles.getContentStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Recent Save Addresses :",
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    4,
                        (index) => Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: _getStack(
                        subTitle: "Anne Thurium",
                        textTitle:
                        "35 State Route 05, aw,\nGrantsville 26143\nUnited States",),
                    ),
                  ),
                ),
              ),
              Text(
                "All Delivery Address :",
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    4,
                        (index) => Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: _getStack(
                        subTitle: "Anne Thurium",
                        textTitle:
                        "35 State Route 05, aw,\nGrantsville 26143\nUnited States",),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaymentSelectScreen(),),);
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
            ],
          ),
        ),
      ),
    );
  }

  _getStack(
      {required String subTitle,
        required String textTitle}) =>
      Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 30.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGray,
                  width: 1,
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subTitle,
                      style: Styles.getOnBoardingTitle().copyWith(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        textTitle,
                        style: Styles.getNodeTitle(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 8,
                top: 18,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditScreen(),),);
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                )
            ),
          ],
        ),
      );

  _getAppBar() => AppBar(
    title: const Center(
        child: Text(
          "Deliver Information",
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
    actions: const [
      SizedBox(
        width: 24,
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
