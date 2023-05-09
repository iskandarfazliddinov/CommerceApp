import 'package:commerce_app/presentation/ui/resources/app_colors.dart';
import 'package:commerce_app/presentation/ui/resources/app_icons.dart';
import 'package:commerce_app/presentation/ui/resources/app_images.dart';
import 'package:commerce_app/presentation/ui/resources/app_styles.dart';
import 'package:commerce_app/presentation/ui/screens/payment_method/check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../edit_profile/edit_screen.dart';

class PaymentSelectScreen extends StatefulWidget {
  const PaymentSelectScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSelectScreen> createState() => _PaymentSelectScreenState();
}

class _PaymentSelectScreenState extends State<PaymentSelectScreen> {
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
              Text("Delivery Information :",style: Styles.getLabelStyle().copyWith(fontSize: 20,),),
              _getStack(subTitle: "Saul Goodmate", textTitle: "16 E Birch Hill Road Fairbanks, NY,\n99312 United States\n\n865-5585 57587"),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0,top: 60),
                child: Text("Payment Method :",style: Styles.getLabelStyle().copyWith(fontSize: 20,),),
              ),
              ...List.generate(4, (index) => Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Card(
                  elevation: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,top: 16,bottom: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.payCard),
                            const SizedBox(width:20 ,),
                            Text("Debit/Credit card",style: Styles.getLabelStyle(),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 2
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckOutScreen(),),);
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
          "Payment Method",
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
      const SizedBox(width: 12,),
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
